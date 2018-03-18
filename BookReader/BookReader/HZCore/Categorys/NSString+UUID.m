//
//  NSString+UUID.m
//  PuJiangCruise
//
//  Created by lianggq on 16/8/18.
//  Copyright © 2016年 skysea. All rights reserved.
//

#import "NSString+UUID.h"

@implementation NSString (UUID)

+ (NSString *)getUUID
{
    NSString *result = nil;
    
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    if (uuid)
    {
        result = (__bridge_transfer NSString *)CFUUIDCreateString(NULL, uuid);
        CFRelease(uuid);
    }
    
    return result;
}

@end
