//
//  NSObject+Swizzle.h
//  SkySea
//
//  Created by whj on 16/1/6.
//  Copyright © 2016年 skysea. All rights reserved.
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

