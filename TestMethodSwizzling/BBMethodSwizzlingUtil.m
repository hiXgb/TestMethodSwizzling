//
//  BBMethodSwizzlingUtil.m
//  TestMethodSwizzling
//
//  Created by xgb on 2017/9/5.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import "BBMethodSwizzlingUtil.h"

@implementation BBMethodSwizzlingUtil

+ (void)bb_swizzleInstanceMethod:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL
{
    Method originalMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = class_getInstanceMethod(class, newSEL);
    
    BOOL addSuccess = class_addMethod(class, originSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (addSuccess) {
        class_replaceMethod(class, newSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)bb_swizzleClassMethod:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL
{
    Method originalMethod = class_getClassMethod(class, originSEL);
    Method swizzledMethod = class_getClassMethod(class, newSEL);
    
    Class metaClass = objc_getMetaClass(class_getName(class));
    BOOL addSuccess = class_addMethod(metaClass, originSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (addSuccess) {
        class_replaceMethod(metaClass, newSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)bb_printInstanceMethodList:(Class)class
{
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(class, &count);
    NSLog(@"%@ instance method list:\r\n",NSStringFromClass(class));
    for (int i = 0; i < count; i ++) {
        Method method = methodList[i];
        SEL sel = method_getName(method);
        IMP imp = method_getImplementation(method);
        NSLog(@"sel:%@",NSStringFromSelector(sel));
    }
}

+ (void)bb_printClassMethodList:(Class)class
{
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(object_getClass(class), &count);
    NSLog(@"%@ class method list:\r\n",NSStringFromClass(class));
    for (int i = 0; i < count; i ++) {
        Method method = methodList[i];
        SEL sel = method_getName(method);
        IMP imp = method_getImplementation(method);
        NSLog(@"sel:%@",NSStringFromSelector(sel));
    }
}

@end
