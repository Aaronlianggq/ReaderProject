//
//  HZDownLoadModuleManager.m
//  BookReader
//
//  Created by lianggq on 2018/3/22.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZDownLoadModuleManager.h"
#import "HZDownLoadTask.h"

const static NSNotificationName DownLoadTaskCountChangeNotification = @"downLoadTaskCountChangeNotification";

@interface HZDownLoadModuleManager() {
    NSMutableArray *_taskArray ;
}
@end

@implementation HZDownLoadModuleManager
+ (void)load {
    RegisterHZModule([self class]);
}

- (void)setupWithContainer {
    if(!_taskArray){
        _taskArray = [[NSMutableArray alloc] init];
    }
}

- (void)teardownWithContainer {
    
    dispatch_sync_safe(self->moduleQueue, self->queueTag, ^{
        for(HZDownLoadTask *task in _taskArray){
            [task cancel];
        }
    });

    _taskArray = nil;
}

#pragma mark -- publick
- (void)addTask:(HZDownLoadTask *)task {
    task.taskManager = self;
    dispatch_sync_safe(self->moduleQueue, self->queueTag, ^{
        [_taskArray addObject:task];
        [task start];
        main_async_thread(^{
            [self postTaskChangeNotifation];
        });
    });
}

- (void)removeTask:(HZDownLoadTask *)task {
    dispatch_sync_safe(self->moduleQueue, self->queueTag, ^{
        [_taskArray removeObject:task];
    });
}

- (NSArray *)tasks {
    
    __block NSArray *array = nil;
    dispatch_sync_safe(self->moduleQueue, self->queueTag, ^{
        array = [_taskArray copy];
    });
    
    return array;
}

- (HZHttpRequestChannel *)taskReqestChannel {
    return self->requestChannel;
}

#pragma mark --private
- (void)postTaskChangeNotifation {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DownLoadTaskCountChangeNotification object:nil];
}

@end
