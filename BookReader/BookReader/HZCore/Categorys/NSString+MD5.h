//
//  NSString+MD5.h
//  SkySea
//
//  Created by 翁阳 on 14/12/8.
//  Copyright (c) 2014年 skysea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

/**
 *  获取 MD5 小写字符串
 *
 *  @return MD5 字符串
 */
- (NSString *)c_md5LowercaseString;


/**
 *  获取 MD5 大写字符串
 *
 *  @return MD5 字符串
 */
- (NSString *)c_md5UppercaseString;

@end
