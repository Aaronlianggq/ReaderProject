//
//  HZModuleManager.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  注册一个基础模块
 *
 *  @param moduleClass 要注册的基础模块类
 */
OBJC_EXPORT void RegisterHZModule(Class moduleClass);


/**
 *  管理所有的模块管理器
 */
@interface HZModuleManager : NSObject

- (void)setUpAllModule;
- (void)tearDownAllModule;

@end
