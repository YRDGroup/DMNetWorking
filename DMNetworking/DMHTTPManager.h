//
//  DMHTTPManager.h
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMBaseRequest.h"

@interface DMHTTPManager : NSObject

+ (DMHTTPManager *)sharedManager;

- (void)startRequest:(DMBaseRequest *)request;

- (BOOL)cancelRequest:(DMBaseRequest *)request;

@end
