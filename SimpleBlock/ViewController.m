//
//  ViewController.m
//  SimpleBlock
//
//  Created by youngstar on 16/3/29.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "ViewController.h"

typedef int (^AddBlock)(int, int);

@interface ViewController ()

@end

@implementation ViewController

int global = 100; // 全局变量：可以使用和改变

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    int (^addNum)(int a, int b) = ^(int a, int b){
        return  a + b;
    };
    NSLog(@"%d", addNum(3, 6));
    
    
    
    // 全局变量：可以使用和改变
    void (^globalBlock)(void) =
    ^(void){
        NSLog(@"globalBlock:%d", global);
        
        global ++;
        
        NSLog(@"globalBlock:%d", global);
    };
    
    globalBlock();
    NSLog(@"globalBlock:%d", global);
    
    
    // 局部变量
    [self test];
    
}

- (void)test
{
    int flag = 10;
    void(^testBlock)(int) =
    ^(int a)
    {
        NSLog(@"flag:%d", flag);
//        flag++;  在Block内部改变局部变量的值会报错
        
        NSLog(@"flag:%d", flag);
    };
    testBlock(flag);
    
    __block  int flag2 = 10;
    void(^testBlock2)(int) =
    ^(int a)
    {
        NSLog(@"flag:%d", flag2 );
        flag2 ++;  // 在局部变量前加__block 可在Block内部改变局部变量的值
        
        NSLog(@"flag:%d", flag2 );
    };
    testBlock2(flag2 );
     NSLog(@"flag:%d", flag2 );
    
    
    AddBlock addBlock = ^(int a, int b)
    {
        return a + b;
    };
    
    int count = addBlock(5,8);
    NSLog(@"count:%d", count);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
