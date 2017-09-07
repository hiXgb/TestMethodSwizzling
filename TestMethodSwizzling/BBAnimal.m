//
//  BBAnimal.m
//  TestMethodSwizzling
//
//  Created by xgb on 2017/9/5.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import "BBAnimal.h"
#import "BBMethodSwizzlingUtil.h"

@implementation BBAnimal

+ (void)load
{
    [BBMethodSwizzlingUtil bb_swizzleInstanceMethod1:[self class] originSEL:@selector(method1) newSEL:@selector(method2)];
    [BBMethodSwizzlingUtil bb_swizzleInstanceMethod1:[self class] originSEL:@selector(method2) newSEL:@selector(method3)];
    [BBMethodSwizzlingUtil bb_swizzleInstanceMethod1:[self class] originSEL:@selector(method4) newSEL:@selector(method5)];
    
    [BBMethodSwizzlingUtil bb_swizzleClassMethod1:[self class] originSEL:@selector(methodA) newSEL:@selector(methodB)];
}

- (void)run
{
    NSLog(@"animal run...");
}

- (void)eat
{
    NSLog(@"animal eat...");
}

- (void)method1
{
    NSLog(@"a");
    [self method1];
}

- (void)method2
{
    NSLog(@"b");
}

- (void)method3
{
    NSLog(@"c");
    [self method3];
}

+ (void)methodA
{
    NSLog(@"A");
}

+ (void)methodB
{
    NSLog(@"B");
}

+ (void)methodC
{
    NSLog(@"C");
}

@end
