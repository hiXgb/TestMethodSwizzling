//
//  BBMethodSwizzlingUtil.h
//  TestMethodSwizzling
//
//  Created by xgb on 2017/9/5.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface BBMethodSwizzlingUtil : NSObject

+ (void)bb_swizzleInstanceMethod1:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL;
+ (void)bb_swizzleInstanceMethod2:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL;
+ (void)bb_swizzleInstanceMethod3:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL;

+ (void)bb_swizzleClassMethod1:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL;
+ (void)bb_swizzleClassMethod2:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL;
+ (void)bb_swizzleClassMethod3:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL;

+ (void)bb_printInstanceMethodList:(Class)class;
+ (void)bb_printClassMethodList:(Class)class;

@end
