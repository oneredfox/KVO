//
//  ViewController.m
//  自定义KVO
//
//  Created by zux2 on 2019/3/13.
//  Copyright © 2019年 zux2. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+ZXKVO.h"

@interface ViewController ()

/*  <#name#>  **/
@property (nonatomic, strong) Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _p = [[Person alloc]init];
    
    [_p addObserver:self forKeyPath:@"arr" options:(NSKeyValueObservingOptionNew) context:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"%@",change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    static int a;
    
    NSMutableArray *tempArr = [_p mutableArrayValueForKey:@"arr"];
    
    [tempArr addObject:@"haha"];
    
    
}

@end
