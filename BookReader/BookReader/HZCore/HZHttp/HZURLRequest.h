//
//  HZURLRequest.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZURLRequest : NSMutableURLRequest

/**
 设置全局的超时时间

 @param timeout
 */
+ (void)setTimeout:(float)timeout;


/**
 获取request get

 @param path   请求地址
 @param params 请求参数
 @return 返回请求对象
 */
+ (HZURLRequest *)urlRequestForGet:(NSString *)path
                        parameters:(NSDictionary *)params;

/**
 获取request Post
 
 @param path   请求地址
 @param params 请求参数
 @return 返回请求对象
 */
+ (HZURLRequest *)urlRequestForPost:(NSString *)path
                         parameters:(NSDictionary *)params;


@end

@interface NSMutableURLRequest(HZCustom)
- (void)setDefaultRequest;
@end
