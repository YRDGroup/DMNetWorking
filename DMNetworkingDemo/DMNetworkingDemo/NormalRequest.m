//
//  NormalRequest.m
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "NormalRequest.h"
#import "DMTestModel.h"

@implementation NormalRequest

- (NSString *)path{
    return @"p2pInitController/getInitData.action";
}

- (NSDictionary *)parameters{
    return @{@"channelId":@"4C9EF1676B564240DF6AA684F968E85A",
             @"clientType":@"1",
             @"sign":@"98793ef4c0cc1f153361e47e7e5c5efc"};
}

- (DMRequestMethod)method{
    return DMRequestPOST;
}

- (Class)modelClass{
    return [DMTestModel class];
}

- (DMAPICachePolicy)cachePolicy {
    return DMUseAPICacheIfExistPolicy;
}

- (NSTimeInterval)cacheValidTime {
    return 60 * 60;
}

@end
