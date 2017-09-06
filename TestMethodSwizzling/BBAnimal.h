//
//  BBAnimal.h
//  TestMethodSwizzling
//
//  Created by xgb on 2017/9/5.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBAnimal : NSObject

- (void)run;
- (void)eat;

- (void)method1;
- (void)method2;
- (void)method3;

+ (void)methodA;
+ (void)methodB;
+ (void)methodC;

@end
