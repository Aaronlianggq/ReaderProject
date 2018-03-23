//
//  DownLoadTask.h
//  BookReader
//
//  Created by lianggq on 2018/3/22.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZDownLoadModuleManager.h"

@interface HZDownLoadTask : NSObject

- (instancetype)initWithRequest:(HZURLRequest *)request;

@property (nonatomic,weak) HZDownLoadModuleManager *taskManager;
///token 唯一标识
@property (nonatomic,copy) NSString* token;
@property (nonatomic,strong,readonly) HZURLRequest *request;
@property (nonatomic,copy,readwrite) HZDownProgressBlock progress;
@property (nonatomic,copy,readwrite) HZDownCompleteBlock complete;
@property (nonatomic,copy,readwrite) HZDownFileBlock destionaFile;

///下载进度  0 ~ 1
@property (nonatomic,readonly) double downProg;

- (void)start;

- (void)cancel;

- (void)resume;

@end


