//
//  HZCentralManager.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZBookModuleManger.h"
#import "HZServerAddressManager.h"
#import "HZLoginModuleManager.h"
#import "HZUserModuleManager.h"

#define hzManager     [HZCentralManager sharedInstance]

/**
 *  管理所有的模块管理器
 */
@interface HZCentralManager : NSObject

///书籍管理器
@property (nonatomic,readonly) HZBookModuleManger *bookModuleManger;
///服务地址管理器
@property (nonatomic,readonly) HZServerAddressManager *serverManger;

+ (instancetype)sharedInstance;

- (id)managerForClass:(Class)managerClass;

- (void)setUpAllModule;
- (void)tearDownAllModule;

@end
