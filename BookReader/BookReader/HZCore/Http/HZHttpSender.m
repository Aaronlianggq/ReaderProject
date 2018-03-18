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

+ (void)setValue:(id)value forHTTPHeaderFieldKey:(NSString *)key
{
    if(key && value)
        [HZAFHttpSessionManager.requestSerializer setValue:value forHTTPHeaderField:key];
}

+ (NSDictionary <NSString *, NSString *> *)getAllHttpHeaderField {
    return HZAFHttpSessionManager.requestSerializer.HTTPRequestHeaders;
}


#pragma mark -- httpRequest Method
+ (NSURLSessionTask *)httpDataGet:(NSString *)urlPath
                           params:(NSDictionary *)params
                         callBack:(HZTTPResponseBlock)callBack {
    
    HZURLRequest *requst = [HZURLRequest urlRequestForGet:urlPath parameters:params];
    return [self httpRequestObjectWithRequest:requst callBack:callBack ];
    
}


+ (NSURLSessionTask *)httpDataPost:(NSString *)urlPath
                            params:(NSDictionary *)params
                          callBack:(HZTTPResponseBlock)callBack {
    
    HZURLRequest *requst = [HZURLRequest urlRequestForPost:urlPath parameters:params];
    return [self httpRequestObjectWithRequest:requst callBack:callBack];
}

+ (NSURLSessionTask *)httpRequestObjectWithRequest:(NSURLRequest *)request
                                          callBack:(HZTTPResponseBlock)callBack
{
    __block NSURLSessionTask* task = nil;
    task = [HZAFHttpSessionManager dataTaskWithRequest:request
                      uploadProgress:nil
                    downloadProgress:nil
                   completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                       
                       [_HttpTasks removeObject:task];
                       
                       HZResponse *hzResponse = [self responseWithReuslt:responseObject error:error];
                       callBack(hzResponse);
                       
                   }];
    
    [_HttpTasks addObject:task];
    
    [task resume];
    return task;
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










