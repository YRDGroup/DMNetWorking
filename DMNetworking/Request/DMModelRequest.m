//
//  DMModelRequest.m
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "DMModelRequest.h"
#import "DMNetworkingConfig.h"

@interface DMModelRequest ()

@property (nonatomic, readwrite, strong) id responseModel;
@property (nonatomic, readwrite, strong) id status;

@end

@implementation DMModelRequest

- (id)responseObject {
    if (self.responseModel && [self responseType] == DMResponseTypeDefault) {
        return self.responseModel;
    }
    return [super responseObject];
}

- (void)requestCompleted{
    
    [super requestCompleted];
    //response is image, can't make model.
    if ([self responseType] == DMResponseTypeImage) return;
    
    BOOL success = !self.error;
    
    id responseStatus;
    id responseObject = [self responseObject];
    
    //if request success and request implement modelClass,
    //when request or default modelMaker implement the delegate ,
    //the response object will be make to model or model list.
    if (success && [self respondsToSelector:@selector(modelClass)]){
        Class defaultModelMaker = [DMNetworkingConfig modelMaker];
        Class modelMaker = nil;
        if (self && [[self class] respondsToSelector:@selector(makeModelWithJSON:class:keysPath:status:)] &&
            [[self class] conformsToProtocol:@protocol(DMModelMakerDelegate)]) {
            modelMaker = [self class];
        }
        else if (defaultModelMaker && [defaultModelMaker respondsToSelector:@selector(makeModelWithJSON:class:keysPath:status:)] &&
                 [defaultModelMaker conformsToProtocol:@protocol(DMModelMakerDelegate)]){
            modelMaker = defaultModelMaker;
        }
        
        if (modelMaker) {
            self.responseModel = [modelMaker makeModelWithJSON:responseObject
                                                         class:[self modelClass]
                                                      keysPath:[self modelKeysPath]
                                                        status:&responseStatus];
            self.status = responseStatus;
        }
    }
}

- (NSArray<NSString *> *)modelKeysPath {
    return nil;
}



@end
