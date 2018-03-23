//
//  HZServerAddressManager.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZServerAddressManager.h"

#define HZHttpHostKey   @"hz.httpHostKey"

@interface HZServerAddressManager(){
    NSMutableDictionary *_hostDic;
}

@end


@implementation HZServerAddressManager
+ (void)load {
    RegisterLoadHZModule([self class]);
}

- (void)setupWithContainer {
    if(_hostDic){
        _hostDic = [[NSMutableDictionary alloc] init];
    }
#ifdef DEBUG
    [self setHttpHostDebug];
#else
    [self setHttpHostRelease];
#endif
}

- (void)teardownWithContainer {
    [_hostDic removeAllObjects];
    _hostDic = nil;
}

#pragma mark public
- (void)changeHttpHostWithScheme:(HZHttpServeSchemeType)schemeType {
#ifdef DEBUG
    switch (schemeType) {
        case HZHttpServeSchemeTypeDebug:
            [self setHttpHostDebug];
            break;
        case HZHttpServeSchemeTypeRelease:
        default:
            [self setHttpHostRelease];
            break;
    }
#endif
}

- (NSString *)getCurrentHttpServerHost {
    return _hostDic[HZHttpHostKey];
}

- (void)setHttpHostDebug {
    @synchronized(self){
        [_hostDic setObject:@"https://hz.test.com/" forKey:HZHttpHostKey];
    }
}

- (void)setHttpHostRelease {
    @synchronized(self){
        [_hostDic setObject:@"https://hz.com/" forKey:HZHttpHostKey];
    }
}
@end
