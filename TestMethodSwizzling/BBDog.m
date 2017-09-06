//
//  BBDog.m
//  TestMethodSwizzling
//
//  Created by xgb on 2017/9/5.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import "BBDog.h"
#import "BBMethodSwizzlingUtil.h"

@implementation BBDog

+ (void)load
{
    [BBMethodSwizzlingUtil bb_swizzleClassMethod:[self class] originSEL:@selector(methodA) newSEL:@selector(methodC)];
}

- (void)sleep
{
    NSLog(@"dog sleep...");
}

@end
