//
//  HZHttpSender.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZResponse.h"

typedef void(^HZTTPResponseBlock)(HZResponse *response);


@interface HZHttpSender : NSObject

+ (NSDictionary <NSString *, NSString *> *)getAllHttpHeaderField;
+ (void)setValue:(id)value forHTTPHeaderFieldKey:(NSString *)key;

#pragma mark -- httpRequest Method  目前只设置GET和POST

/**
 接口请求 POST

 @param urlPath 请求地址
 @param params 请求参数
 @param callBack 返回结果
 @return 返回http请求对象
 */
+ (NSURLSessionTask *)httpDataPost:(NSString *)urlPath
                            params:(NSDictionary *)params
                          callBack:(HZTTPResponseBlock)callBack;


/**
 接口请求 GET
 
 @param urlPath 请求地址
 @param params 请求参数
 @param callBack 返回结果
 @return 返回http请求对象
 */
+ (NSURLSessionTask *)httpDataGet:(NSString *)urlPath
                           params:(NSDictionary *)params
                         callBack:(HZTTPResponseBlock)callBack;

@end




@interface HZHttpSender(handleReuslt)

/**
 获取请求结果

 @param responseObject http返回的内容
 @param error http错误信息
 @return 获取请求结果
 */
+ (HZResponse *)responseWithReuslt:(id)responseObject error:(NSError *)error;

@end
