//
//  DMTestModel.m
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "DMTestModel.h"

@implementation DMTestModel

//mantle
+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{@"loadingPage":@"loadingPage",
             @"payBanks":@"payBanks",
             @"payPageRiskTips":@"payPageRiskTips",
             @"productListData":@"productListData",
             @"refreshData":@"refreshData",
             @"registerButton":@"registerButton",
             @"registerConfirm":@"registerConfirm",
             @"registerNext":@"registerNext",
             @"riskReserveFundDesc":@"riskReserveFundDesc",
             @"riskReserveFundImg":@"riskReserveFundImg",
             @"riskReserveFundMoney":@"riskReserveFundMoney",
             @"soldOutRemind":@"soldOutRemind",
             @"withdrawalBanks":@"withdrawalBanks",
             };
}

//mj
+ (NSDictionary *)replacedKeyFromPropertyName {
    return [self JSONKeyPathsByPropertyKey];
}

@end
