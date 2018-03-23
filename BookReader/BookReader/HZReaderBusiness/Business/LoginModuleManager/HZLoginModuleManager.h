//
//  HZLoginModuleManager.h
//  BookReader
//
//  Created by lianggq on 2018/3/23.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModule.h"
#import "HZUserModel.h"

@interface HZLoginModuleManager : HZModule
///当前登录对象
@property (nonatomic,strong,readonly) HZUserModel *currentUser;

@end
