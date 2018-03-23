//
//  HZCentralManager.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>


#define hzManager     [HZCentralManager sharedInstance]

@class HZServerAddressManager;
/**
 *  管理所有的模块管理器
 */
@interface HZCentralManager : NSObject

///服务地址管理器
@property (nonatomic,readonly) HZServerAddressManager *serverManger;

+ (instancetype)sharedInstance;


/**
 延时注册ModuleManager   建议在+initialize 执行

 @param managerClass HZModule Class
 */
- (void)registerManager:(Class)managerClass;
- (id)managerForClass:(Class)managerClass;


/**
 模块管理
 */
- (void)setUpAllModule;
- (void)tearDownAllModule;

@end
