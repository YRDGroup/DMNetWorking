//
//  DMRequestGroup.h
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DMBaseRequest;
@interface DMRequestGroup : NSObject

+ (void)startWithRequests:(NSArray *)requests
                 finished:(void (^)(NSArray<DMBaseRequest *> *requests))finished;

@end
