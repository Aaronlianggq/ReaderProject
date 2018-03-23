//
//  HZFileModuleManager.m
//  BookReader
//
//  Created by lianggq on 2018/3/22.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZFileModuleManager.h"

@implementation HZFileModuleManager {
    NSFileManager *_fileManager;
}

+ (void)load {
    RegisterLoadHZModule([self class]);
}

- (void)setupWithContainer {
    if(!_fileManager){
        _fileManager = [NSFileManager defaultManager];
    }
}

- (void)teardownWithContainer {
    
}

#pragma mark -- publick

- (BOOL)removeFilePath:(NSString *)path {
    return [_fileManager removeItemAtPath:path error:nil];
}

- (BOOL)extisePath:(NSString *)path {
    return [_fileManager fileExistsAtPath:path];
}

@end


@implementation HZFileModuleManager(HZBook)

- (BOOL )saveCurrentUserPathWithBookId:(NSString *)bookId {
    return YES;
}

- (NSString *)getCurrentUserPathWithBookId:(NSString *)bookId; {
    return nil;
}

- (BOOL)removeBookPath:(NSString *)bookId {
    
    return [self removeFilePath:bookId];
}

@end



