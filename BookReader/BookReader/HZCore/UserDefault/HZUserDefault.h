//
//  HZUserDefault.h
//  BookReader
//
//  Created by lianggq on 2018/3/20.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZUserDefault : NSObject

+ (NSString *)getStringValue:(NSString *)key;

+ (BOOL)setStringValue:(NSString *)value forKey:(NSString *)key ;

@end
