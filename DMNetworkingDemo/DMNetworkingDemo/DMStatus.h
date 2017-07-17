//
//  DMStatus.h
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface DMStatus : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *errorCode;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *result;

@end
