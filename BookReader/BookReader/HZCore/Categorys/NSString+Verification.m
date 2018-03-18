//
//  NSString+Verification.m
//  PuJiangCruise
//
//  Created by whj on 16/9/13.
//  Copyright © 2016年 skysea. All rights reserved.
//

#import "NSString+Verification.h"

@implementation NSString (Verification)

+ (BOOL)c_isNilOrEmpty:(NSString *)aString {
    
    if (aString == nil || [aString isEqualToString:@"(null)"] || [aString isEqualToString:@"<null>"]) return true;
    
    NSString *check = [aString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return check.length == 0;
}

+ (BOOL)c_isNumber:(NSString *)string {
    
    NSString *result = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(result.length > 0)
    {
        return false;
    }
    return true;
}

- (BOOL)c_checkStringByRegex:(NSString *)regex {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

- (NSString *)c_obtainFirstByString:(NSString *)string {
    
    NSRange range = [self rangeOfString:string];
    return [self substringToIndex:range.location];
}

+ (NSString *)c_deleteLastCharFromString:(NSString *)string {
    
    return [string substringWithRange:NSMakeRange(0, [string length] - 1)];
}

@end
