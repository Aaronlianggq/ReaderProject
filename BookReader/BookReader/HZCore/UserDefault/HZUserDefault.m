//
//  HZUserDefault.m
//  BookReader
//
//  Created by lianggq on 2018/3/20.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZUserDefault.h"

@implementation HZUserDefault

+ (NSString *)getStringValue:(NSString *)key {
    if (!key) {
        return nil;
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults stringForKey:key];
}


+ (BOOL)setStringValue:(NSString *)value forKey:(NSString *)key {
    if (!key) {
        return NO;
    }
    if (!value) {
        value = @"";
    }
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    
    return YES;
}


@end
