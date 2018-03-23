//
//  HZHttpSender.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HZResponse.h"

@class HZURLRequest;
@interface HZHttpSender : NSObject

+ (void)setTimeOut:(NSTimeInterval)timeout;
+ (void)setValue:(id)value forHTTPHeaderFieldKey:(NSString *)key;
+ (NSDictionary <NSString *, NSString *> *)getAllHttpHeaderField;

/**
 接口请求 Request
 
 @param request 请求对象
 @param callback 返回结果
 @return 返回http请求对象
 */
+ (NSURLSessionTask *)httpRequestObjectWithRequest:(HZURLRequest *)request
                                          callBack:(void (^)(NSURLResponse *  response, id   responseObject, NSError *  error))callback;



/**
 下载文件接口请求

 @param request 请求对象
 @param downloadProgress 下载进度
 @param destination 目标文件
 @param completionHandler 完成返回结果
 */
+ (NSURLSessionDownloadTask *)httpDownRequestObjectWithReqeust:(HZURLRequest *)request
                                progress:(void(^) (NSProgress *downloadProgress))downloadProgress
                             destination:(NSURL *(^)(NSURL *  targetPath, NSURLResponse *  response))destination
                       completionHandler:(void(^)(NSURLResponse *  response, NSURL *  filePath, NSError *  error))completionHandler;


+ (void)cancelRequestTask:(NSURLSessionTask *)task;

+ (void)cancelAllRequestTask;

@end




@interface HZHttpSender(handleReuslt)

/**
 获取请求结果

 @param responseObject http返回的内容
 @param error   http错误信息
 @param rsp     http服务返回信息
 @return 获取请求结果
 */
+ (HZResponse *)responseWithReuslt:(id)responseObject
                             error:(NSError *)error
                          response:(NSURLResponse *)rsp;

@end
