//
//  HZModule.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZModuleManager.h"

/**
 *  基础模块的生命周期
 */
@protocol PJCModuleLifecycle <NSObject>

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
@interface HZModule : NSObject <PJCModuleLifecycle>



@end
