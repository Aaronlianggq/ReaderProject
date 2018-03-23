//
//  HZCache.h
//  BookReader
//
//  Created by lianggq on 2018/3/23.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZCache : NSCache

- (id)tryForKey:(NSString *)cacheKey valueBlock:(id (^)(void))block;

@end
