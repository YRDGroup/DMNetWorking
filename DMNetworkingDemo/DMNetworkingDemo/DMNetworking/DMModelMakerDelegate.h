//
//  DMModelMakerDelegate.h
//  DMNetworkingDemo
//
//  Created by 李二狗 on 2017/7/17.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DMModelMakerDelegate <NSObject>

@optional

+ (id)makeModelWithJSON:(NSDictionary *)json
                  class:(Class)modelClass
               keysPath:(NSArray *)keysPath
                 status:(id __autoreleasing *)status;

@end
