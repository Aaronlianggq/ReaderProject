//
//  HZModule.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModule.h"
#import "HZServerAddressManager.h"

@interface HZModule()

@end

@implementation HZModule

- (BOOL)isClassToModuleProtocal:(Class<HZModuleModelProtocol>)aclass {
    
    BOOL isToProtocal = [aclass conformsToProtocol:@protocol(HZModuleModelProtocol)];
#ifdef DEBUG
    if(!isToProtocal){
        NSAssert(NO, @"[%@ isClassToModuleProtocal] error, %@ is not to HZModuleModelProtocol",NSStringFromClass([self class]),NSStringFromClass(aclass));
    }
#endif
    return isToProtocal;
}

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
    if(self){
        HZHttpRequestChannel *channel = [HZHttpRequestChannel requestChannel];
        self->requestChannel = channel;
        
        moduleQueue = dispatch_queue_create([NSString stringWithFormat:@"queue.module.%@", NSStringFromClass([self class])].UTF8String, NULL);
        queueTag = &queueTag;
        dispatch_queue_set_specific(moduleQueue, queueTag, queueTag, NULL);
    }
    
    return self;
}

- (void)setupWithContainer {}
- (void)teardownWithContainer {}

+ (NSString *)getHostString {
    return [hzManager.serverManger getCurrentHttpServerHost];
}

@end

