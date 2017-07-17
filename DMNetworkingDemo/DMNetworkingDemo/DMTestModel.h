//
//  DMTestModel.h
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface DMTestModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSDictionary *loadingPage;
@property (nonatomic, copy) NSString *payBanks;
@property (nonatomic, copy) NSString *payPageRiskTips;
@property (nonatomic, copy) NSString *productListData;
@property (nonatomic, copy) NSArray *refreshData;
@property (nonatomic, copy) NSString *registerButton;
@property (nonatomic, copy) NSString *registerConfirm;
@property (nonatomic, copy) NSString *registerNext;
@property (nonatomic, copy) NSString *riskReserveFundDesc;
@property (nonatomic, copy) NSString *riskReserveFundImg;
@property (nonatomic, copy) NSString *riskReserveFundMoney;
@property (nonatomic, copy) NSString *soldOutRemind;
@property (nonatomic, copy) NSString *withdrawalBanks;

@end
