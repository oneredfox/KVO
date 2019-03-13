//
//  NSObject+ZXKVO.h
//  自定义KVO
//
//  Created by zux2 on 2019/3/13.
//  Copyright © 2019年 zux2. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZXKVO)

- (void)ZX_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end

NS_ASSUME_NONNULL_END
