//
//  NSObject+Swizzle.h
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (void)swizzleClassMethod:(Class)classname originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector;
+ (void)swizzleInstanceMethod:(Class)classname originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector;

@end

#pragma mark - ---- NSArray

@interface NSArray (Swizzle)

@end

#pragma mark - ---- NSMutableDictionary

@interface NSMutableDictionary (Swizzle)

@end

