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

//request
typedef void(^HZTTPResponseBlock)(HZResponse *response);

//download
typedef void(^HZDownProgressBlock)( int64_t totalUnitCount, int64_t currentCount, double prog);
typedef NSURL *(^HZDownFileBlock)( NSURL *targetPath);
typedef void(^HZDownCompleteBlock)( NSData *data , NSError *error);

@interface HZHttpRequestChannel : NSObject {
@protected
    NSMutableArray*_httpRequestTasks ;
}

+ (instancetype)requestChannel;

#pragma mark -- httpRequest Method  目前只设置GET和POST
/**
 接口请求 POST
 
 @param urlPath 请求地址
 @param params 请求参数
 @param callback 返回结果
 */
- (NSURLSessionTask *)post:(NSString *)urlPath
      params:(NSDictionary *)params
    callBack:(HZTTPResponseBlock)callback;

/**
 接口请求 GET
 
 @param urlPath 请求地址
 @param params 请求参数
 @param callback 返回结果
 */
- (NSURLSessionTask *)get:(NSString *)urlPath
      params:(NSDictionary *)params
    callBack:(HZTTPResponseBlock)callback;

/**
 接口请求
 
 @param request 请求对象
 @param callback 返回结果
 */
- (NSURLSessionTask *)request:(HZURLRequest *)request
       callBack:(HZTTPResponseBlock)callback;


/**
 下载

 @param request 请求对象
 @param progress 下载及进度
 @param destinaFile 保存的文件地址
 @param complete 返回结果
 @return  返回任务
 */
- (NSURLSessionDownloadTask *)downRequest:(HZURLRequest *)request
                                 progress:(HZDownProgressBlock)progress
                              destinaFile:(HZDownFileBlock)destinaFile
                           completeHander:(HZDownCompleteBlock)complete;


/**
 取消请求

 @param task 取消任务对象
 */
- (void)cancelRequestTask:(NSURLSessionTask *)task;

- (void)cancelAllTask;

@end
