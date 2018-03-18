//
//  HZModuleManager.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookModuleManger.h"

/**
 *  管理所有的模块管理器
 */
@interface HZModuleManager : NSObject

@property (nonatomic,readonly) BookModuleManger *bookModule;


- (void)setUpAllModule;
- (void)tearDownAllModule;

@end
