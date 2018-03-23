//
//  HZResponse.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZHttpSender.h"

@implementation HZResponse

+ (instancetype)response {
    
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if(self){
        
    }
    return self;
}

- (BOOL)isError{
    return  (self.rsp.statusCode !=200  || self.serverStatusCode != 200 ) ;
}

- (HZResponseStatusCode) serverStatusCode {
    //需要更改逻辑
    if([_body isKindOfClass:[NSDictionary class]]){
        return [_body[@"server"] integerValue];
    }
    return  HZResponseStatusSuccess ;
}

@end
