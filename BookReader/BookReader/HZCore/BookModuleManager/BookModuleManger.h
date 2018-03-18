//
//  BookModuleManger.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModule.h"
#import "BookModel.h"

@interface BookModuleManger : HZModule

/**
 获取书籍信息
 @param callback    返回结果
 */
- (void)getBookInfoUrlCallBack:(void (^)(BookModel *model))callback;

/**
 获取当前用户书架的信息
 @param callback    返回结果
 */
- (void)getUserShelfBooksCallBack:(void (^)(NSArray<BookModel *> *bookModels))callback;

@end
