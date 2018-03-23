//
//  HZHttpRequestChannel.m
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZHttpRequestChannel.h"
#import "HZHttpSender.h"

@interface HZHttpRequestChannel()

@end

@implementation HZHttpRequestChannel

+ (instancetype)requestChannel {
    
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _httpRequestTasks = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark -- httpRequest Method
- (NSURLSessionTask *)post:(NSString *)urlPath
      params:(NSDictionary *)params
    callBack:(HZTTPResponseBlock)callback {
    
    HZURLRequest *request = [HZURLRequest urlRequestForPost:urlPath parameters:params];
    return [self request:request callBack:callback];
    
}

- (NSURLSessionTask *)get:(NSString *)urlPath
     params:(NSDictionary *)params
   callBack:(HZTTPResponseBlock)callback {
    
    HZURLRequest *request = [HZURLRequest urlRequestForGet:urlPath parameters:params];
    return [self request:request callBack:callback];
}

- (NSURLSessionTask *)request:(HZURLRequest *)request
       callBack:(HZTTPResponseBlock)callback{
    return [HZHttpSender httpRequestObjectWithRequest:request callBack:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        HZResponse *hzResponse = [HZHttpSender responseWithReuslt:responseObject error:error response:response];
        callback(hzResponse);
    }];
    
}

- (NSURLSessionDownloadTask *)downRequest:(HZURLRequest *)request
           progress:(HZDownProgressBlock)progress
        destinaFile:(HZDownFileBlock)destinaFile
     completeHander:(HZDownCompleteBlock)complete {
    
   return [HZHttpSender httpDownRequestObjectWithReqeust:request progress:^(NSProgress *downloadProgress) {
        
        int64_t total = downloadProgress.totalUnitCount;
        int64_t complete = downloadProgress.completedUnitCount;
        double pro = 0.0;
        if(total > 0){
            pro = complete /(double)total;
        }
        progress(total,complete,pro);
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        return destinaFile(targetPath);
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        if(error){
            complete(nil,error);
        }else{
            NSData *data = [NSData dataWithContentsOfURL:filePath];
            complete(data,nil);
        }
    }];
}

#pragma mark tasks

- (void)cancelRequestTask:(NSURLSessionTask *)task {
    [HZHttpSender cancelRequestTask:task];
}

- (void)cancelAllTask {
    [HZHttpSender cancelAllRequestTask];
}


@end
