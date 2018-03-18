//
//  HZBaseModel.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZBaseModel.h"
#import "MJExtension.h"

@implementation HZBaseModel

- (instancetype)initWithDictionary:(NSDictionary *)modelData {
    
    self = [super init];
    if(self){
        [self mj_setKeyValues:modelData];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    return [self mj_keyValues];
}

+ (NSMutableArray <HZBaseModel *> *)getModelsWithArray:(NSArray *)modelDatas {
    return [self mj_objectArrayWithKeyValuesArray:modelDatas];
}

@end
