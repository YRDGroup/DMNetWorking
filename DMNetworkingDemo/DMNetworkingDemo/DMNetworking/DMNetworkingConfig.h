//
//  DMNetworkingConfig.h
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMModelMakerDelegate.h"

@interface DMNetworkingConfig : NSObject


/**
 初始化配置文件

 @param baseUrl 请求的baseURL
 @param contentTypes 解析类型
 @param allowInvalidCer // Whether or not to trust servers with an invalid or expired SSL certificates. Defaults to `NO`.

 @param validDomain 校验证书对应的域名
 @param operationCount 多线程同时存在的最大个数
 @param timeOut 超时时间
 @param maker 数据处理成的model
 */
+ (void)setDefaultBaseUrl:(NSString *)baseUrl
   acceptableContentTypes:(NSSet *)contentTypes
 allowInvalidCertificates:(BOOL)allowInvalidCer
      validatesDomainName:(BOOL)validDomain
        maxOperationCount:(int)operationCount
          timeOutInterval:(NSTimeInterval)timeOut
               modelMaker:(Class<DMModelMakerDelegate>)maker;

+ (NSString *)defaultBaseUrl;

+ (NSSet *)acceptableContentTypes;

+ (BOOL)allowInvalidCertificates;

+ (BOOL)validatesDomainName;

+ (int)maxConcurrentOperationCount;

+ (Class<DMModelMakerDelegate>)modelMaker;

+ (NSTimeInterval)timeOutInterval;

//如果为null是否移除该键值对
+ (void)setRemovesKeysWithNullValues:(BOOL)remove;

+ (BOOL)removesKeysWithNullValues;

@end


//缓存处理
@interface DMNetworkingConfig (GJAPICache)

+ (void)setCacheDirectory:(NSString *)dir;

+ (NSString *)getCacheDirectory;

@end
