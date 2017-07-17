//
//  DMBaseRequest.m
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "DMBaseRequest.h"
#import "DMHTTPManager.h"

@interface DMBaseRequest ()

@property (nonatomic, readwrite, assign) DMRequestState state;
@property (nonatomic, copy, readwrite) DMCompletedBlock completedBlock;
@property (nonatomic, copy, readwrite) DMRequestFinishedBlock successBlock;
@property (nonatomic, copy, readwrite) DMRequestFinishedBlock failedBlock;
@property (nonatomic, readwrite, strong) id status;
@property (nonatomic, readwrite, strong) NSError *error;
@property (nonatomic, readwrite, strong) id responseObject;
@property (nonatomic, readwrite, strong) id responseJson;

@end

@implementation DMBaseRequest

- (void)start {
    self.state = DMRequestStateExcuting;
    [[DMHTTPManager sharedManager] startRequest:self];
}

- (void)startWithSuccessBlock:(DMRequestFinishedBlock)success
                  failedBlock:(DMRequestFinishedBlock)failed {
    self.successBlock = success;
    self.failedBlock = failed;
    [self start];
}

- (void)startWithCompletedBlock:(DMCompletedBlock)completedBlock {
    self.completedBlock = completedBlock;
    [self start];
}

- (void)cancel {
    if ([[DMHTTPManager sharedManager] cancelRequest:self]) {
        self.state = DMRequestStateCanceled;
    }
}

- (void)retry {
    _currentRetryTimes ++;
    [self start];
}

- (NSUInteger)retryTimes {
    return 0;
}

#pragma mark- public response method
- (BOOL)isRequestSuccessed {
    return !self.error;
}

- (BOOL)isCanceled {
    if (self.task.state == NSURLSessionTaskStateCanceling || self.error.code == -999) return YES;
    return NO;
}

- (BOOL)isNetworking{
    return self.state == DMRequestStateExcuting;
}

- (void)requestTerminate {
    
    if (!self.isCanceled) {
        self.state = DMRequestStateFinished;
    }
    
    [self requestCompleted];
    
    BOOL success = !self.error;
    
    id responseObject = self.responseObject;
    
    //call back
    if (success && self.successBlock) {
        self.successBlock(responseObject, self.status, nil);
    }
    
    if (!success && self.failedBlock) {
        self.failedBlock(responseObject, nil, self.error);
    }
    
    !self.completedBlock ? : self.completedBlock(self);
    
    self.successBlock = nil;
    self.failedBlock = nil;
    self.completedBlock = nil;
}

- (void)requestCompleted {}

#pragma mark- request config
//default method is 'GET'
- (DMRequestMethod)method {
    return DMRequestGET;
}

- (NSString *)baseUrl {
    return @"";
}

- (NSString *)path {
    return @"";
}

- (NSDictionary *)parameters {
    return nil;
}

- (NSTimeInterval)timeOutInterval {
    return 30;
}

- (DMResponseType)responseType {
    return DMResponseTypeDefault;
}

@end
