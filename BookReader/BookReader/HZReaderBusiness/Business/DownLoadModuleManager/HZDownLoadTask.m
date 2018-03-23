//
//  DownLoadTask.m
//  BookReader
//
//  Created by lianggq on 2018/3/22.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZDownLoadTask.h"
#import "HZDefineConfig.h"
#import "HZGCDSafetyBlock.h"

@interface HZDownLoadTask() {
    NSURLSessionDownloadTask *_downTask;
}

@end

@implementation HZDownLoadTask


- (instancetype)initWithRequest:(HZURLRequest *)rst {
    self = [self init];
    _request = rst;
    return self;
}
- (void)dealloc {
    _downTask = nil;
}

- (void)start {
    
    HZHttpRequestChannel *channel = [self.taskManager taskReqestChannel];
    WS;
    _downTask = [channel downRequest:_request
                             progress:^(int64_t totalUnitCount, int64_t currentCount, double prog) {
                                 [weakSelf safetyProgress:totalUnitCount complete:currentCount progress:prog];
                             }
                          destinaFile:^NSURL *(NSURL *targetPath) {
                              
                              return [weakSelf safetyFile:targetPath];
                          }
                       completeHander:^(NSData *data, NSError *error) {
                           
                           [weakSelf safetyComplete:data error:error];
                       }];
    
    
}

- (void)cancel {
    [_downTask cancel];
}

- (void)resume {
    [_downTask resume];
}
#pragma mark --setter
- (void)setComplete:(HZDownCompleteBlock)complete {
    @synchronized(self){
        _complete = complete;
    }
}

- (void)setProgress:(HZDownProgressBlock)progress {
    @synchronized(self){
        _progress = progress;
    }
}

- (void)setDestionaFile:(HZDownFileBlock)destionaFile {
    @synchronized(self){
        _destionaFile = destionaFile;
    }
}

#pragma mark --private;
- (void)safetyProgress:(int64_t)countSize complete:(int64_t)comSize progress:(double)prog {
    @synchronized(self){
        _downProg = prog;
        if(_progress){
            _progress(countSize,comSize,prog);
        }
    }
}

- (void)safetyComplete:(NSData *)data error:(NSError *)error {
    [self.taskManager removeTask:self];
    @synchronized(self){
        if(_complete){
            _complete(data,error);
        }
    }
}

- (NSURL *)safetyFile:(NSURL *)targetUrl {
    @synchronized(self){
        if(_destionaFile){
            return _destionaFile(targetUrl);
        }
        return targetUrl;
    }
}
@end
