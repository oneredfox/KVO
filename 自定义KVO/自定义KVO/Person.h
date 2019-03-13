//
//  Person.h
//  自定义KVO
//
//  Created by zux2 on 2019/3/13.
//  Copyright © 2019年 zux2. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

/* <#name#> **/
@property (nonatomic, copy) NSString *name;

/*  <#name#>  **/
@property (nonatomic, strong) NSMutableArray *arr;

@end

NS_ASSUME_NONNULL_END
