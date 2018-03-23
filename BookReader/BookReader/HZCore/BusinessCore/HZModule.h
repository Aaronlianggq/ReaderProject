//
//  HZModule.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "HZHttpRequestChannel.h"
#import "HZModuleModelProtocol.h"
#import "HZGCDSafetyBlock.h"
#import "HZCentralManager.h"


#define HZ_Current_Host     [HZModule getHostString]

/**
 *  启动注册一个基础模块 (子类在+load里执行注册，自动执行setupWithContainer)
 *
 *  @param moduleClass 要注册的基础模块类
 *  由HZModuleManager 去实现
 */
OBJC_EXPORT void RegisterLoadHZModule(Class moduleClass);

/**
 *  基础模块的生命周期
 */
@protocol HZModuleLifecycle <NSObject>

@required
/**
 *  初始化管理器  子类实现
 *
 *
 */
- (void)setupWithContainer;


/**
 *  摧毁管理器   子类实现
 *
 *
 */
- (void)teardownWithContainer;


@end

@class HZCentralManager;
/**
 模块管理
 */
@interface HZModule : NSObject <HZModuleLifecycle> {
@protected
    
    HZHttpRequestChannel * requestChannel;
    
    /**
     *  GCD 队列
     */
    dispatch_queue_t moduleQueue;
    void *queueTag;
}

- (BOOL)isClassToModuleProtocal:(Class<HZModuleModelProtocol>)aclass;

/**
 由中央管理器构造 CentralManager

 @return 返回当前HZModule
 */
- (instancetype)initWithCentralManager;

/**
 获取当前接口host

 @return host
 */
+ (NSString *)getHostString;

@end
