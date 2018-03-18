//
//  BookModule.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModule.h"

@interface BookModule : HZModule


/**
 获取书籍信息

 @param callback 返回结果
 */
- (void)getBookInfoUrl:(NSString *)url
              callBack:(HZTTPResponseBlock)callback;


@end
