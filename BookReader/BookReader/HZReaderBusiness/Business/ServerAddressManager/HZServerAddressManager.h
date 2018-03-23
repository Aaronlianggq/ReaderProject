//
//  HZServerAddressManager.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZModule.h"

typedef enum : NSInteger
{
    HZHttpServeSchemeTypeDebug = 0,                 //测试
    HZHttpServeSchemeTypeRelease  ,                 //发布
    
}HZHttpServeSchemeType;

@interface HZServerAddressManager : HZModule

/**
 获取当前开发环境域名值

 @return host
 */
- (NSString *)getCurrentHttpServerHost;


/**
 替换开发环境
 @param schemeType 模块
 */
- (void)changeHttpHostWithScheme:(HZHttpServeSchemeType)schemeType;

@end
