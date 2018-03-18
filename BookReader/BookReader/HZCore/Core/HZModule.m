//
//  HZModule.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModule.h"
#import "HZCentralManager.h"

@interface HZModule()
@end

@implementation HZModule


/**
 由中央管理器创建

 @return nil
 */
- (id)init
{
    [self doesNotRecognizeSelector:@selector(init)];
    return nil;
}

- (instancetype)initWithCentralManager{
    
    id module = [hzManager managerForClass:[self class]];
    if(module) return module;
    
    self = [super init];
    return self;
}

- (void)setupWithContainer {}
- (void)teardownWithContainer {}

+ (NSString *)getHostString {
    return [hzManager.serverManger getCurrentHttpServerHost];
}
@end

