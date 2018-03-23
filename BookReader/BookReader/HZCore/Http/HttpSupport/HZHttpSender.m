//
//  HZHttpSender.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZHttpSender.h"
#import "AFNetworking.h"
#import "HZURLRequest.h"

@implementation HZHttpSender

static AFHTTPSessionManager *HZAFHttpSessionManager = nil;
static NSMutableArray*_HttpTasks = nil;

+ (void)load{
    _HttpTasks = [[NSMutableArray alloc] init];
    
    HZAFHttpSessionManager = [AFHTTPSessionManager manager];
    HZAFHttpSessionManager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    HZAFHttpSessionManager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    HZAFHttpSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/plain", @"text/html", nil];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    HZAFHttpSessionManager.securityPolicy = securityPolicy;
}

+ (void)setTimeOut:(NSTimeInterval)timeout {
    HZAFHttpSessionManager.requestSerializer.timeoutInterval = timeout;
    [HZURLRequest setTimeout:timeout];
}

+ (void)setValue:(id)value forHTTPHeaderFieldKey:(NSString *)key
{
    if(key && value)
        [HZAFHttpSessionManager.requestSerializer setValue:value forHTTPHeaderField:key];
}

+ (NSDictionary <NSString *, NSString *> *)getAllHttpHeaderField {
    return HZAFHttpSessionManager.requestSerializer.HTTPRequestHeaders;
}


+ (NSURLSessionTask *)httpRequestObjectWithRequest:(HZURLRequest *)request
                                          callBack:(void (^)(NSURLResponse *  response, id   responseObject, NSError *  error))callback
{
    if(request == nil) return nil;
    
    [self handerReqeust:request];
    
    __block NSURLSessionTask* task = nil;
    task = [HZAFHttpSessionManager dataTaskWithRequest:request
                      uploadProgress:nil
                    downloadProgress:nil
                   completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                       
                       if(callback)
                            callback(response,responseObject,error);
                   }];
    [task resume];
    return task;
}

+ (NSURLSessionDownloadTask *)httpDownRequestObjectWithReqeust:(HZURLRequest *)request
               progress:(void(^) (NSProgress *downloadProgress))dlProgress
            destination:(NSURL *(^)(NSURL *  targetPath, NSURLResponse *  response))destination
                       completionHandler:(void(^)(NSURLResponse *  response, NSURL *  filePath, NSError *  error))completionHandler{
    
    if(request == nil) return nil;
    
    [self handerReqeust:request];
    
    NSURLSessionDownloadTask *downloadTask = [HZAFHttpSessionManager downloadTaskWithRequest:request
                                           progress:^(NSProgress * _Nonnull downloadProgress) {
                                               if(dlProgress)
                                                    dlProgress(downloadProgress);
                                           }
                                        destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                                            if(destination)
                                            return destination(targetPath,response);
                                            else
                                                return targetPath;
                                        }
                                  completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                      if(completionHandler)
                                      completionHandler(response,filePath,error);
                                  }];
    [downloadTask resume];
    return downloadTask;
    
}

+ (void)handerReqeust:(HZURLRequest *)reqeust {
    NSDictionary *httpFeilds = HZAFHttpSessionManager.requestSerializer.HTTPRequestHeaders;
    
    [httpFeilds enumerateKeysAndObjectsUsingBlock:^(id field, id value, BOOL * __unused stop) {
        if (![reqeust valueForHTTPHeaderField:field]) {
            [reqeust setValue:value forHTTPHeaderField:field];
        }
    }];
}

+ (void)cancelRequestTask:(NSURLSessionTask *)task {
    [task cancel];
}

/** 直接使用系统原生的获取tasks方法，防止AF阻塞主线程 */
+ (void)cancelAllRequestTask {
    NSURLSession* session = HZAFHttpSessionManager.session;
    [session getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {
        NSArray* tasks = dataTasks;
        for (NSURLSessionTask* task in tasks) {
            [task cancel];
        }
    }];
}


@end


@implementation HZHttpSender(handleReuslt)

+ (HZResponse *)responseWithReuslt:(id)responseObject
                             error:(NSError *)error
                          response:(NSURLResponse *)rsp{
    HZResponse *response = [HZResponse response];
    response.body = responseObject;
    response.error = error;
    if([rsp isKindOfClass:[NSHTTPURLResponse class]])
        response.rsp = (NSHTTPURLResponse *)rsp;
    return response;
}
@end










