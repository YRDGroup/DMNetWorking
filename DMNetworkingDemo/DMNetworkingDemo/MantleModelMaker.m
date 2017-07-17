//
//  MantleModelMaker.m
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "MantleModelMaker.h"
#import "DMStatus.h"

@implementation MantleModelMaker

+ (id)makeModelWithJSON:(NSDictionary *)json
                  class:(Class)modelClass
                 status:(id __autoreleasing *)status{
    
    MTLJSONAdapter *adapter = [[MTLJSONAdapter alloc] initWithModelClass:[DMStatus class]];
    DMStatus *sta = [adapter modelFromJSONDictionary:json error:nil];
    *status = sta;
    
    id dataJson = json[@"data"];
    if ([dataJson isKindOfClass:[NSDictionary class]]) {
        adapter = [[MTLJSONAdapter alloc] initWithModelClass:modelClass];
        id model = [adapter modelFromJSONDictionary:dataJson error:nil];
        return model;
    }
    else if ([dataJson isKindOfClass:[NSArray class]]){
        NSArray *array = [MTLJSONAdapter modelsOfClass:modelClass fromJSONArray:dataJson error:nil];
        return array;
    }
    
    NSLog(@"unavailable json!");
    return nil;
}


@end
