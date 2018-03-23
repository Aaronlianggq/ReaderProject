//
//  HZDownLoadModuleManager.h
//  BookReader
//
//  Created by lianggq on 2018/3/22.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModule.h"

const static NSNotificationName DownLoadTaskCountChangeNotification;

@class HZDownLoadTask;
@interface HZDownLoadModuleManager : HZModule 
@property(nonatomic,readonly) HZHttpRequestChannel *taskReqestChannel;

- (void)addTask:(HZDownLoadTask *)task ;

- (void)removeTask:(HZDownLoadTask *)task;

- (NSArray <HZDownLoadTask *>*)tasks;

@end
