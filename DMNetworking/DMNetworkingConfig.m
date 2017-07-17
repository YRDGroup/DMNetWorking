//
//  DMNetworkingConfig.m
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "DMNetworkingConfig.h"

static NSString *baseUrl;
static NSSet *acceptableContentTypes;
static BOOL allowInvalidCertificates = NO;
static BOOL validatesDomainName = NO;
static int maxConcurrentOperationCount = 4;
static Class<DMModelMakerDelegate> modelMaker;
static NSTimeInterval timeOutInterval = 60;

static BOOL _removesKeysWithNullValues = NO;

@implementation DMNetworkingConfig

+ (void)setDefaultBaseUrl:(NSString *)url
   acceptableContentTypes:(NSSet *)contentTypes
 allowInvalidCertificates:(BOOL)allowInvalidCer
      validatesDomainName:(BOOL)validDomain
        maxOperationCount:(int)operationCount
          timeOutInterval:(NSTimeInterval)timeOut
               modelMaker:(Class<DMModelMakerDelegate>)maker
{
    baseUrl = url ? [url copy] : nil;
    acceptableContentTypes = contentTypes ? contentTypes : nil;
    allowInvalidCertificates = allowInvalidCer;
    validatesDomainName = validDomain;
    maxConcurrentOperationCount = operationCount ? operationCount : 4;
    if (maker) {
        modelMaker = maker;
    }
    timeOutInterval = timeOut ? timeOut : 60;
}

+ (NSString *)defaultBaseUrl{
    return baseUrl;
}

+ (NSSet *)acceptableContentTypes{
    return acceptableContentTypes;
}

+ (BOOL)allowInvalidCertificates{
    return allowInvalidCertificates;
}

+ (BOOL)validatesDomainName{
    return validatesDomainName;
}

+ (int)maxConcurrentOperationCount{
    return maxConcurrentOperationCount;
}

+ (Class<DMModelMakerDelegate>)modelMaker{
    return modelMaker;
}

+ (NSTimeInterval)timeOutInterval{
    return timeOutInterval;
}

+ (void)setRemovesKeysWithNullValues:(BOOL)remove {
    _removesKeysWithNullValues = remove;
}

+ (BOOL)removesKeysWithNullValues {
    return _removesKeysWithNullValues;
}

@end

static NSString *dm_cacheDirectory = @"DMAPICacheDirectory";

@implementation DMNetworkingConfig (GJAPICache)

+ (void)setCacheDirectory:(NSString *)dir {
    dm_cacheDirectory = dir;
}

+ (NSString *)getCacheDirectory {
    return dm_cacheDirectory;
}




@end
