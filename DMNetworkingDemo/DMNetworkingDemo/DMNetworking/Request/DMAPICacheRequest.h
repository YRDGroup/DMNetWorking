//
//  DMAPICacheRequest.h
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "DMBaseRequest.h"

typedef NS_ENUM(NSUInteger, DMAPICachePolicy) {
    /**
     * 不用缓存，不存缓存
     */
    DMNotAPICachePolicy,
    
    /**
     * 请求失败时使用缓存(如果缓存有效期内)，存储缓存
     */
    DMUseAPICacheWhenFailedPolicy,
    
    /**
     * 如果有缓存，则用缓存，不请求(如果缓存有效期内)，存储缓存
     */
    DMUseAPICacheIfExistPolicy,
};

@interface DMAPICacheRequest : DMBaseRequest

/**
 *  接口可以自定义缓存地址
 */
- (NSString *)cacheDirectory;

/**
 * 缓存策略
 */
- (DMAPICachePolicy)cachePolicy;

/**
 * 缓存有效期,秒
 */
- (NSTimeInterval)cacheValidTime;

@end
