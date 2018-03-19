//
//  HZHttpRequestChannel.m
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZHttpRequestChannel.h"
#import "HZHttpSender.h"


@interface HZHttpRequestChannel(){

}

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
- (void)post:(NSString *)urlPath
      params:(NSDictionary *)params
    callBack:(HZTTPResponseBlock)callback {
    
    HZURLRequest *request = [HZURLRequest urlRequestForPost:urlPath parameters:params];
    [self request:request callBack:callback];
    
}

- (void)get:(NSString *)urlPath
     params:(NSDictionary *)params
   callBack:(HZTTPResponseBlock)callback {
    
    HZURLRequest *request = [HZURLRequest urlRequestForGet:urlPath parameters:params];
    [self request:request callBack:callback];
}

- (void)request:(HZURLRequest *)request
       callBack:(HZTTPResponseBlock)callback{
    [HZHttpSender httpRequestObjectWithRequest:request callBack:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        HZResponse *hzResponse = [HZHttpSender responseWithReuslt:responseObject error:error];
        callback(hzResponse);
    }];
    
}

#pragma mark tasks

- (void)cancelRequest:(NSString *)urlPath {
    [HZHttpSender cancelRequest:urlPath];
}

- (void)cancelAllRequest {
    [HZHttpSender cancelAllRequest];
}


@end
