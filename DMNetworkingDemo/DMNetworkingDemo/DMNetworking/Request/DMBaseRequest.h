//
//  DMBaseRequest.h
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMBaseRequest.h"
#import "DMRequestDelegate.h"

//请求方式
typedef NS_ENUM(NSUInteger, DMRequestMethod) {
    DMRequestGET,  //获取
    DMRequestPOST, //提交
    DMRequestHEAD, //和 get类似，但只返回头部，不返回主体部分
    DMRequestPUT,  //写入资源
    DMRequestPATCH,//和 put类似，但只是更新部分资源
    DMRequestDELETE //删除
};

//当前的请求状态
typedef NS_ENUM(NSUInteger, DMRequestState) {
    DMRequestStateReady,  //就绪
    DMRequestStateExcuting,//执行中
    DMRequestStateCanceled,//已取消
    DMRequestStateFinished //已完成
};

typedef NS_ENUM(NSUInteger, DMResponseType) {
    DMResponseTypeDefault,  //default is json
    DMResponseTypeImage     //this is return image object response type
};

typedef void (^DMCompletedBlock)(DMBaseRequest * request);
typedef void (^DMRequestFinishedBlock)(id responseObject, id status , NSError *error);
typedef void (^DMDNSBlock)(BOOL usedDNs, NSString *domain, NSString *newBaseUrl);

@interface DMBaseRequest : NSObject

@property (nonatomic, weak) id<DMRequestDelegate> delegate;

/**
 *  request的状态，（准备，执行中，被取消，结束）
 */
@property (nonatomic, readonly) DMRequestState state;

/**
 *  请求的任务，目前主要是operation，以后可能会换成session
 */
@property (nonatomic, strong) NSURLSessionTask *task;

/**
 *  请求结束block，参数是当前request
 */
@property (nonatomic, copy, readonly) DMCompletedBlock completedBlock;

/**
 *  请求成功的block
 */
@property (nonatomic, copy, readonly) DMRequestFinishedBlock successBlock;

/**
 *  请求失败的block
 */
@property (nonatomic, copy, readonly) DMRequestFinishedBlock failedBlock;
//@property (nonatomic, strong) NSMutableDictionary *HTTPRequestHeaders;
/**
 *  当前请求重试次数
 */
@property (nonatomic, assign, readonly) NSUInteger currentRetryTimes;

/**
 *  请求error
 */
@property (nonatomic, readonly, strong) NSError *error;

/**
 *  请求返回的object，根据request设置可以为json也可为model
 */
@property (nonatomic, readonly, strong) id responseObject;

/**
 *  请求返回的object，纯json
 */
@property (nonatomic, readonly, strong) id responseJson;

/**
 *  请求方法
 */
- (DMRequestMethod)method;

/**
 *  发出请求的方法，参数是回调block，不区分成功失败，可从request的属性中取到，更为灵活
 */
- (void)startWithCompletedBlock:(DMCompletedBlock)completedBlock;

/**
 *  取消请求
 */
- (void)cancel;

/**
 *  请求是否成功，主要依据error来判断是否成功
 */
- (BOOL)isRequestSuccessed;

/**
 *  请求是否被cancel
 */
- (BOOL)isCanceled;

/**
 *  请求是否在执行中
 */
- (BOOL)isNetworking;

#pragma mark - user implement methods
//default base url is setted in GJNetWorkingConfig and you can set single base url.
/**
 *  请求服务器的baseUrl
 */
- (NSString *)baseUrl;

/**
 *  请求服务器的路径
 */
- (NSString *)path;

/**
 *  请求的参数
 */
- (NSDictionary *)parameters;

/**
 *  返回的类型
 */
- (DMResponseType)responseType;

/**
 *  请求的重试次数，默认为0
 */
- (NSUInteger)retryTimes;

/**
 *  请求的超时时间，默认为20秒
 */
- (NSTimeInterval)timeOutInterval;

/**
 *  选择实现此方法，在使用baseUrl前调用，主要为了项目中处理DNS问题，选择是使用IP还是域名
 */
- (void)dNSWithBaseUrl:(NSString *)baseUrl dNSBlock:(DMDNSBlock)dnsBlock;


#pragma mark- Pravite Method
/**
 *  请求成功后，callback之前会调用此方法，子类处理很多数据逻辑，重写请慎重
 */
- (void)requestCompleted;

/**
 *  发出请求
 */
- (void)start;

/**
 *  请求重试
 */
- (void)retry;

/**
 *  请求结束后的统一回调，请勿重写
 */
- (void)requestTerminate;

- (BOOL)shouldRetryWithResponseObject:(id)responseObject
                                error:(NSError *)error;


#pragma mark- deprecated
/**
 *  发出请求的方法，参数是回调block
 */
- (void)startWithSuccessBlock:(DMRequestFinishedBlock)success
                  failedBlock:(DMRequestFinishedBlock)failed __attribute__((deprecated("Replaced by -startWithCompletedBlock:")));
;



@end
