//
//  HZCache.m
//  BookReader
//
//  Created by lianggq on 2018/3/23.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZCache.h"

@implementation HZCache

- (instancetype)init {
    self = [super init];
    return self;
}

- (id)tryForKey:(NSString *)cacheKey valueBlock:(id (^)(void))block
{
    id value = [self objectForKey:cacheKey];
    
    if (value == nil) {
        value = block();
        [self setObject:value forKey:cacheKey];
    }
    return value;
}

- (void)setObject:(id)obj forKey:(id)key {
    if(key && obj){
        [super setObject:obj forKey:key];
    }
}

@end
