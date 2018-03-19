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
    
    NSDictionary *httpFeilds = HZAFHttpSessionManager.requestSerializer.HTTPRequestHeaders;
    
    [httpFeilds enumerateKeysAndObjectsUsingBlock:^(id field, id value, BOOL * __unused stop) {
        if (![request valueForHTTPHeaderField:field]) {
            [request setValue:value forHTTPHeaderField:field];
        }
    }];
    
    __block NSURLSessionTask* task = nil;
    task = [HZAFHttpSessionManager dataTaskWithRequest:request
                      uploadProgress:nil
                    downloadProgress:nil
                   completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                       callback(response,responseObject,error);
                   }];
    [task resume];
    return task;
}


/** 直接使用系统原生的获取tasks方法，防止AF阻塞主线程 */
+ (void)cancelRequest:(NSString *)urlPath {
    
    NSURLSession* session = HZAFHttpSessionManager.session;
    [session getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {
        NSArray* tasks = dataTasks;
        for (NSURLSessionTask* task in tasks) {
            NSURLRequest* request = task.currentRequest;
            if ([[request.URL.absoluteString lowercaseString] hasPrefix:[urlPath lowercaseString]]) {
                [task cancel];
                break;
            }
        }
    }];
}

+ (void)cancelAllRequest {
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

+ (HZResponse *)responseWithReuslt:(id)responseObject error:(NSError *)error {
    HZResponse *response = [HZResponse response];
    
    response.body = responseObject;
    response.error = error;
    return response;
}
@end










