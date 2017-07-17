//
//  DMRequestGroup.m
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "DMRequestGroup.h"
#import "DMBaseRequest.h"

@implementation DMRequestGroup

+ (void)startWithRequests:(NSArray *)requests
                 finished:(void (^)(NSArray<DMBaseRequest *> *))finished {
    
    if (requests.count == 0) {
        !finished ? : finished(requests);
    }
    
    dispatch_group_t group = dispatch_group_create();
    
    for (DMBaseRequest *request in requests) {
        dispatch_group_enter(group);
        [request startWithCompletedBlock:^(DMBaseRequest *request) {
            dispatch_group_leave(group);
        }];
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        !finished ? : finished(requests);
    });
    
}

@end
