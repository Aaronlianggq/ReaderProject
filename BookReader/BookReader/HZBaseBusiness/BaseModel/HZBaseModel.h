//
//  HZBaseModel.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZBaseModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)modelData;

- (NSDictionary *)toDictionary;


@end
