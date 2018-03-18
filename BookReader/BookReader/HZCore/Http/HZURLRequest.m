//
//  HZURLRequest.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZURLRequest.h"
#import "HZHttpSender.h"

static float hzTimeout = 10.f;

@implementation HZURLRequest

+ (void)setTimeout:(float)timeout {
    hzTimeout = timeout;
}

+ (HZURLRequest *)urlRequestForGet:(NSString *)path
                         parameters:(NSDictionary *)params
{
    
    NSURL* url = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:kCFStringEncodingUTF8]];
    
    NSMutableString *urlStr = [NSMutableString stringWithString:url.absoluteString];
    if (![urlStr hasSuffix:@"?"]) {
        [urlStr appendFormat:@"?"];
    }
    
    NSArray *allKeys = [params allKeys];
    for (NSString *aKey in allKeys) {
        [urlStr appendFormat:@"%@=%@&", aKey, [params valueForKey:aKey]];
    }
    if ([urlStr hasSuffix:@"&"] || [urlStr hasSuffix:@"?"]) {
        [urlStr deleteCharactersInRange:NSMakeRange(urlStr.length-1, 1)];
    }
    HZURLRequest *request = [[HZURLRequest alloc] initWithURL:[NSURL URLWithString:urlStr]
                                                    cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                timeoutInterval:hzTimeout];
    [request setDefaultRequest];
    [request setHTTPMethod:@"GET"];

    return request;
}


+ (HZURLRequest *)urlRequestForPost:(NSString *)path
                          parameters:(NSDictionary *)params

{
    NSURL* url = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:kCFStringEncodingUTF8]];
    
    NSMutableDictionary *parametersDic = [[NSMutableDictionary alloc] init];
    if (params != nil) {
        [parametersDic addEntriesFromDictionary:params];
    }
    
    HZURLRequest *request = [[HZURLRequest alloc] initWithURL:url
                                                    cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                timeoutInterval:hzTimeout];
    
    [request setDefaultRequest];
    [request setHTTPBody:[self jsonDataForNSDictionary:params]];
    [request setHTTPMethod:@"POST"];
    
    return request;
    
}

#pragma mark util
+ (NSData *)jsonDataForNSDictionary:(NSDictionary *)dataDic {
    if ([NSJSONSerialization isValidJSONObject:dataDic]) {
        NSError *error = nil;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        if (error == nil) {
            return jsonData;
        }
    }
    
    return nil;
}

@end


@implementation NSMutableURLRequest(HZCustom)

- (void)setDefaultRequest {
    [self addAFHttpFeilds];
    [self addAFHttpFeilds];
    self.timeoutInterval = hzTimeout;
}

#pragma mark private
- (void)addDefaultHttpFeild{
    [self setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [self setValue:@"application/json" forHTTPHeaderField:@"Accept"];
}

- (void)addAFHttpFeilds {
    NSDictionary *httpFeilds = [HZHttpSender getAllHttpHeaderField];
    [httpFeilds enumerateKeysAndObjectsUsingBlock:^(id field, id value, BOOL * __unused stop) {
        if (![self valueForHTTPHeaderField:field]) {
            [self setValue:value forHTTPHeaderField:field];
        }
    }];
}


@end


