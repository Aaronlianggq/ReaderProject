//
//  HZHttpRequestChannel.h
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZResponse.h"
#import "HZURLRequest.h"

@interface HZHttpRequestChannel : NSObject {
@protected
    NSMutableArray*_httpRequestTasks ;
}

#pragma mark -- httpRequest Method  目前只设置GET和POST
/**
 接口请求 POST
 
 @param urlPath 请求地址
 @param params 请求参数
 @param callback 返回结果
 */
- (void)post:(NSString *)urlPath
      params:(NSDictionary *)params
    callBack:(HZTTPResponseBlock)callback;

/**
 接口请求 GET
 
 @param urlPath 请求地址
 @param params 请求参数
 @param callback 返回结果
 */
- (void)get:(NSString *)urlPath
      params:(NSDictionary *)params
    callBack:(HZTTPResponseBlock)callback;

/**
 接口请求
 
 @param request 请求对象
 @param callback 返回结果
 */
- (void)request:(HZURLRequest *)request
       callBack:(HZTTPResponseBlock)callback;


- (void)cancelRequest:(NSString *)urlPath;
- (void)cancelAllRequest;

@end
