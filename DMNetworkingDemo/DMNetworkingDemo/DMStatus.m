//
//  DMStatus.m
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "DMStatus.h"

@implementation DMStatus

//mantle
+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{@"errorCode":@"errorCode",
             @"message":@"msg",
             @"result":@"result"};
}

//mj
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"errorCode":@"errorCode",
             @"message":@"msg",
             @"result":@"result"};
}

@end
