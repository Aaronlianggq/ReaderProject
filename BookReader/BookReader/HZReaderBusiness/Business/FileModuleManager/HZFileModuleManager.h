//
//  HZFileModuleManager.h
//  BookReader
//
//  Created by lianggq on 2018/3/22.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModule.h"

@interface HZFileModuleManager : HZModule

- (BOOL)removeFilePath:(NSString *)path;

- (BOOL)extisePath:(NSString *)path;

@end


@interface HZFileModuleManager(HZBook)

- (BOOL )saveCurrentUserPathWithBookId:(NSString *)bookId;
- (NSString *)getCurrentUserPathWithBookId:(NSString *)bookId;

- (BOOL)removeBookPath:(NSString *)bookId;

@end;
