//
//  NSString+Verification.h
//  PuJiangCruise
//
//  Created by whj on 16/9/13.
//  Copyright © 2016年 skysea. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  字符串验证相关扩展
 */
@interface NSString (Validation)

/**
 *  是否为 nil 或则空
 *
 *  @param aString 要判定的字符串
 *
 *  @return 判定结果
 */
+ (BOOL)c_isNilOrEmpty:(NSString *)aString;


/*!
 *  是否是纯十进制数字
 *
 *  @param string 目标字符串
 *
 *  @return 判定结果
 */
+ (BOOL)c_isNumber:(NSString *)string;

/*!
 *  是否含有正则表达式的字符串
 *
 *  @param regex regex字符串
 *
 *  @return 判定结果
 */
- (BOOL)c_checkStringByRegex:(NSString *)regex;

/**
 *  获取字符串的一部分
 *
 *  @param string 分割字符
 *
 *  @return 分割后的第一部分
 */
- (NSString *)c_obtainFirstByString:(NSString *)string;

/**
 *  删除字符串最后一个字符
 *
 *  @param string 目标字符串
 *
 *  @return 结果
 */
+ (NSString *)c_deleteLastCharFromString:(NSString *)string;

@end
