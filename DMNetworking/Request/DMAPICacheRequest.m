//
//  DMAPICacheRequest.m
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "DMAPICacheRequest.h"
#import "DMNetworkingConfig.h"
#import <CommonCrypto/CommonDigest.h>

@interface DMAPICacheRequest ()

/**
 *  使用的缓存对象
 */
@property (nonatomic, strong) id cacheObject;

@end

@implementation DMAPICacheRequest

- (DMAPICachePolicy)cachePolicy {
    return DMNotAPICachePolicy;
}

- (NSTimeInterval)cacheValidTime {
    return -1;
}

- (NSString *)cacheDirectory {
    return nil;
}

- (NSError *)error {
    if (self.cacheObject) {
        return nil;
    }
    return [super error];
}

- (id)responseObject {
    if (self.cacheObject) {
        return self.cacheObject;
    }
    return [super responseObject];
}

- (id)responseJson {
    if (self.cacheObject) {
        return self.cacheObject;
    }
    return [super responseJson];
}

- (NSString *)apiCacheFilePath {
    NSString *directoryPath = [self apiCacheDirectoryPath];
    NSString *filePath = [directoryPath stringByAppendingPathComponent:[self makeCacheFileNameKey]];
    return filePath;
}

- (NSString *)apiCacheDirectoryPath {
    NSString *path = [self directoryPathWithDirectoryName:[DMNetworkingConfig getCacheDirectory]];
    if ([self respondsToSelector:@selector(cacheDirectory)]) {
        path = [self cacheDirectory].length ? [self cacheDirectory] : path;
    }
    return path;
}

- (NSString *)makeCacheFileNameKey {
    NSString *method = [NSString stringWithFormat:@"%@",[NSNumber numberWithInt:[self method]]];
    NSString *baseUrl = [DMNetworkingConfig defaultBaseUrl];
    if ([self respondsToSelector:@selector(baseUrl)]) {
        baseUrl = [self baseUrl];
    }
    NSString *path = @"";
    if ([self respondsToSelector:@selector(path)]) {
        path = [self path];
    }
    NSString *parameters = @"";
    if ([self respondsToSelector:@selector(parameters)]) {
        parameters = [NSString stringWithFormat:@"%@",[self parameters]];
    };
    NSString *keyString = [NSString stringWithFormat:@"%@_%@_%@_%@",method,baseUrl,path,parameters];
    keyString = [self cachedFileNameForKey:keyString];
    return keyString;
}

#pragma mark- private

- (NSTimeInterval)existTimeOfCache:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSDictionary *attributes = [fileManager attributesOfItemAtPath:path error:&error];
    if (!attributes) {
        NSLog(@"get file:%@ ,attribute failed:%@", path, error);
        return -1;
    }
    NSTimeInterval interval = -[[attributes fileModificationDate] timeIntervalSinceNow];
    return interval;
}

- (void)archiveJsonToCurrentAPICache:(NSDictionary *)jsonDic {
    [self archiveJson:jsonDic toCacheFilePath:[self apiCacheFilePath]];
}

- (void)archiveJson:(NSDictionary *)jsonDic toCacheFilePath:(NSString *)path{
    if ([self cacheValidTime] > 0) {
        if (jsonDic && [self checkCacheDirecotryExist]) {
            
            BOOL cacheSuccess = [NSKeyedArchiver archiveRootObject:jsonDic toFile:path];
            if (!cacheSuccess) NSLog(@"achicve json to cache failed!");
            else NSLog(@"achicve json to cache success!");
        }
    }
}

- (BOOL)checkCacheDirecotryExist {
    NSString *dirPath = [self apiCacheDirectoryPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dirPath]) {
        return [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return YES;
}

- (NSString *)cachedFileNameForKey:(NSString *)key {
    const char *str = [key UTF8String];
    if (str == NULL) {
        str = "";
    }
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    
    return filename;
}

- (NSString *)directoryPathWithDirectoryName:(NSString *)dirName {
    return [[self cachesPath] stringByAppendingPathComponent:dirName];
}

- (NSString *)cachesPath
{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}


@end
