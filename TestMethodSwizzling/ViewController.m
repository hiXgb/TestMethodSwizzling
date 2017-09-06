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
    
    BBAnimal *animal = [BBAnimal new];
    [animal method1];   //b
    [animal method2];   //cab
    [animal method3];   //ab
    
    [BBMethodSwizzlingUtil bb_printInstanceMethodList:[BBAnimal class]];
    
    [BBDog methodA];
    [BBDog methodB];
    [BBDog methodC];
    
    [BBMethodSwizzlingUtil bb_printClassMethodList:[BBDog class]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
