//
//  BBMethodSwizzlingUtil.m
//  TestMethodSwizzling
//
//  Created by xgb on 2017/9/5.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import "BBMethodSwizzlingUtil.h"

@implementation BBMethodSwizzlingUtil

+ (void)bb_swizzleInstanceMethod1:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL
{
    Method originalMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = class_getInstanceMethod(class, newSEL);
    
    if (!originalMethod || !swizzledMethod) {
        return;
    }
    
    IMP originalIMP = method_getImplementation(originalMethod);
    IMP swizzledIMP = method_getImplementation(swizzledMethod);
    const char *originalType = method_getTypeEncoding(originalMethod);
    const char *swizzledType = method_getTypeEncoding(swizzledMethod);
    
    BOOL addSuccess = class_addMethod(class, originSEL, swizzledIMP, swizzledType);
    if (addSuccess) {
        class_replaceMethod(class, newSEL, originalIMP, originalType);
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

//不推荐使用
+ (void)bb_swizzleInstanceMethod2:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL
{
    Method originalMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = class_getInstanceMethod(class, newSEL);
    
    if (!originalMethod || !swizzledMethod) {
        return;
    }
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (void)bb_swizzleInstanceMethod3:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL
{
    Method originalMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = class_getInstanceMethod(class, newSEL);
    
    if (!originalMethod || !swizzledMethod) {
        return;
    }
    
    IMP originalIMP = method_getImplementation(originalMethod);
    IMP swizzledIMP = method_getImplementation(swizzledMethod);
    const char *originalType = method_getTypeEncoding(originalMethod);
    const char *swizzledType = method_getTypeEncoding(swizzledMethod);
    
    class_replaceMethod(class,newSEL,originalIMP,originalType);
    class_replaceMethod(class,originSEL,swizzledIMP,swizzledType);
}

+ (void)bb_swizzleClassMethod1:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL
{
    Method originalMethod = class_getClassMethod(class, originSEL);
    Method swizzledMethod = class_getClassMethod(class, newSEL);
    
    if (!originalMethod || !swizzledMethod) {
        return;
    }
    
    Class metaClass = objc_getMetaClass(class_getName(class));
    IMP originalIMP = method_getImplementation(originalMethod);
    IMP swizzledIMP = method_getImplementation(swizzledMethod);
    const char *originalType = method_getTypeEncoding(originalMethod);
    const char *swizzledType = method_getTypeEncoding(swizzledMethod);
    
    BOOL addSuccess = class_addMethod(metaClass, originSEL, swizzledIMP, swizzledType);
    if (addSuccess) {
        class_replaceMethod(metaClass, newSEL, originalIMP, originalType);
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

//不推荐使用
+ (void)bb_swizzleClassMethod2:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL
{
    Method originalMethod = class_getClassMethod(class, originSEL);
    Method swizzledMethod = class_getClassMethod(class, newSEL);
    
    if (!originalMethod || !swizzledMethod) {
        return;
    }
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (void)bb_swizzleClassMethod3:(Class)class originSEL:(SEL)originSEL newSEL:(SEL)newSEL
{
    Method originalMethod = class_getClassMethod(class, originSEL);
    Method swizzledMethod = class_getClassMethod(class, newSEL);
    
    if (!originalMethod || !swizzledMethod) {
        return;
    }
    
    Class metaClass = objc_getMetaClass(class_getName(class));
    IMP originalIMP = method_getImplementation(originalMethod);
    IMP swizzledIMP = method_getImplementation(swizzledMethod);
    const char *originalType = method_getTypeEncoding(originalMethod);
    const char *swizzledType = method_getTypeEncoding(swizzledMethod);
    
    class_replaceMethod(metaClass,newSEL,originalIMP,originalType);
    class_replaceMethod(metaClass,originSEL,swizzledIMP,swizzledType);
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
