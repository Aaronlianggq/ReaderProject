//
//  NSString+MD5.m
//  SkySea
//
//  Created by 翁阳 on 14/12/8.
//  Copyright (c) 2014年 skysea. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+MD5.h"

@implementation NSString (MD5)


- (NSString *)c_md5LowercaseString;
{
    return [self p_md5:self].lowercaseString;
}


- (NSString *)c_md5UppercaseString
{
    return [self p_md5:self].uppercaseString;
}


- (NSString *)p_md5:(NSString *)inputStr
{
    const char *cStr = [inputStr UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (unsigned)strlen(cStr), result);
    
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ]; 
}


@end
