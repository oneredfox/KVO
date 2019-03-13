//
//  Person.m
//  自定义KVO
//
//  Created by zux2 on 2019/3/13.
//  Copyright © 2019年 zux2. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSMutableArray *)arr {
    
    if (!_arr) {
        _arr = NSMutableArray.array;
    }
    
    return _arr;
}

@end
