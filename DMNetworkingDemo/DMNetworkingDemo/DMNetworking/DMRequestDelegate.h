//
//  DMRequestDelegate.h
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DMBaseRequest;

@protocol DMRequestDelegate <NSObject>

- (void)requestWillStart:(DMBaseRequest *)request;
- (void)requestDidStart:(DMBaseRequest *)request;

- (void)requestWillStop:(DMBaseRequest *)request;
- (void)requestDidStop:(DMBaseRequest *)request;

@end
