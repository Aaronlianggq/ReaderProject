//
//  HZModule.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZHttpSender.h"

/**
 *  启动注册一个基础模块 (子类在+load里执行注册，自动执行setupWithContainer. 如果不需要自动执行，则可以在load取消进行延时注册)
 *
 *  @param moduleClass 要注册的基础模块类
 *  由HZModuleManager 去实现
 */
OBJC_EXPORT void RegisterHZModule(Class moduleClass);

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


/**
 模块管理
 */
@interface HZModule : NSObject <HZModuleLifecycle>


/**
 由中央管理器构造 CentralManager

 @return 返回当前HZModule
 */
- (instancetype)initWithCentralManager;

@end
