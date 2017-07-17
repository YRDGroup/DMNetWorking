//
//  DMModelRequest.h
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "DMAPICacheRequest.h"
#import "DMModelMakerDelegate.h"

@interface DMModelRequest : DMAPICacheRequest<DMModelMakerDelegate>

/**
 *  请求返回的model，如果开启自动转换model功能
 */
@property (nonatomic, readonly, strong) id responseModel;

/**
 *  请求返回的状态，如果开启自动转换功能
 */
@property (nonatomic, readonly, strong) id status;

/**
 *  如果想自动转换model，则需要实现此方法，返回需要转换的model类型
 *  同时也必须指定modelMaker
 */
- (Class)modelClass;

/**
 *  modelMaker中可以根据这个返回的参数来进行解析
 *
 *  @return [@"data","modelList"];
 */
- (NSArray<NSString *> *)modelKeysPath;


@end
