//
//  HZBookModuleManger.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModule.h"
#import "HZBookModel.h"

@interface HZBookModuleManger : HZModule

/**
 获取书籍信息
 @param callback    返回结果
 */
- (void)getBookParams:(NSDictionary *)param
             callBack:(void (^)(HZBookModel *model))callback;

/**
 获取当前用户书架的信息
 @param callback    返回结果
 */
- (void)getUserShelfBooksParams:(NSDictionary *)param
                       callBack:(void (^)(NSArray<HZBookModel  *> *bookModels))callback;

@end
