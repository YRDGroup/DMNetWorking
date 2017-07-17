//
//  ViewController.m
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "NormalRequest.h"
#import "DMTestModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NormalRequest *request = [NormalRequest new];
    [request startWithCompletedBlock:^(DMBaseRequest *request) {
        DMTestModel *model = (DMTestModel*)request.responseObject;
        NSLog(@"%@",model);
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
