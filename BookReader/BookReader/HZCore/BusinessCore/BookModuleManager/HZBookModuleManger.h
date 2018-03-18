//
//  HZBookModuleManger.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModule.h"
#import "BookModel.h"

@interface HZBookModuleManger : HZModule

/**
 获取书籍信息
 @param callback    返回结果
 */
- (void)getBookInfoUrlCallBack:(void (^)(NSObject<HZModuleModelProtocol> *model))callback
             withProtocalClass:(Class<HZModuleModelProtocol>)classModel;

/**
 获取当前用户书架的信息
 @param callback    返回结果
 */
- (void)getUserShelfBooksCallBack:(void (^)(NSArray<NSObject<HZModuleModelProtocol> *> *bookModels))callback
                withProtocalClass:(Class<HZModuleModelProtocol>)classModel;

@end
