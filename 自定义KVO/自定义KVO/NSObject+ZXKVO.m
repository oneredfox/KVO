//
//  NSObject+ZXKVO.m
//  自定义KVO
//
//  Created by zux2 on 2019/3/13.
//  Copyright © 2019年 zux2. All rights reserved.
//

#import "NSObject+ZXKVO.h"

#import <objc/message.h>

@implementation NSObject (ZXKVO)

- (void)ZX_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
    
    //创建一个类
    NSString *oldClass = NSStringFromClass(self.class);
    NSString *newClass = [@"ZXKVO_" stringByAppendingString:oldClass];
    Class myClass = objc_allocateClassPair(self.class, newClass.UTF8String, 0);
    objc_registerClassPair(myClass);
    
    //重写setter
    class_addMethod(myClass, @selector(setName:), (IMP)setName, "v:@:");
    
    //修改isa
    object_setClass(self, myClass);
    
    //将观察者绑定到当前对象
    //自己的d方法中不要用sstrong
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_ASSIGN);
    
}


void setName(id self, SEL _cmd, NSString *newName) {
    
    //调用父类的setname
    
    //1.获取当前类
    Class class = [self class];
    //2.重新指向isa到父类
    object_setClass(self, class_getSuperclass(class));
    //3.调用父类的方法

    objc_msgSend(self, @selector(setName:),newName);
    
    //获取绑定的观察者
    id observer =  objc_getAssociatedObject(self, @"observer");
    if (observer) {
        objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),@"name",self,@{@"new":newName,@"kind":@"1"},nil);
    }
    
    //改回子类
    object_setClass(self, class);
    NSLog(@"重写KVO成功%@",newName);
}

@end
