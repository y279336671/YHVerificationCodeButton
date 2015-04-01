//
//  ViewController.m
//  YHVerificationCodeButton
//
//  Created by 杨贺 on 15-3-31.
//  Copyright (c) 2015年 goodo. All rights reserved.
//

#import "ViewController.h"
#import "YHVerificationCodeButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YHVerificationCodeButton *codeButton=[[YHVerificationCodeButton alloc]initWithFrame:CGRectMake(100,100, 100, 50)];
    codeButton.normalColor=[UIColor redColor];
    codeButton.pressedColor=[UIColor blackColor];
    codeButton.timeout=60;
    [self.view addSubview:codeButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
