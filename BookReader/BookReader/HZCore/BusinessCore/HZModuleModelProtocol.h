//
//  HZModuleModelProtocol.h
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HZModuleModelProtocol <NSObject>
@required
- (void)setParamsWithDictionary:(NSDictionary *)modelData;

- (NSDictionary *)toDictionary;

+ (NSMutableArray  *)getModelsWithArray:(NSArray *)modelDatas;


@end
