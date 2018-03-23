//
//  HZUserModuleManager.m
//  BookReader
//
//  Created by lianggq on 2018/3/23.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZUserModuleManager.h"

@implementation HZUserModuleManager

+ (void)load {
    RegisterLoadHZModule([self class]);
}

- (void)setupWithContainer {
    
}

- (void)teardownWithContainer {
    
}

#pragma mark --

@end
