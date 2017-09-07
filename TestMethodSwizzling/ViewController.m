//
//  ViewController.m
//  TestMethodSwizzling
//
//  Created by xgb on 2017/9/5.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import "ViewController.h"
#import "BBDog.h"
#import "BBMethodSwizzlingUtil.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [BBMethodSwizzlingUtil bb_printInstanceMethodList:[BBAnimal class]];
    [BBMethodSwizzlingUtil bb_printInstanceMethodList:[BBDog class]];
    
    BBAnimal *animal = [BBAnimal new];
    [animal method1];   //b
    [animal method2];   //cab
    [animal method3];   //ab
    
    NSLog(@"\r\n------------------------------\r\n");
    
    [BBDog methodA];
    [BBDog methodB];
    [BBDog methodC];
    
//    self.restoresFocusAfterTransition = YES;    //NS_AVAILABLE_IOS(10_0);
//    BOOL b = self.restoresFocusAfterTransition;
//    UIUserInterfaceLayoutDirection layoutDirection = self.view.effectiveUserInterfaceLayoutDirection;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
