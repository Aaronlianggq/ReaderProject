//
//  HZResponse.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger
{
    HZResponseStatusSuccess = 200,               //接收成功

    
}HZResponseStatusCode;


@interface HZResponse : NSObject

+ (instancetype)response;

///http成功时有值
@property (nonatomic,strong) id body;
///服务器 自定义的code
@property (nonatomic,readonly) HZResponseStatusCode serverStatusCode;
///http错误时有值
@property (nonatomic,strong) NSError *error;
@property (nonatomic,readonly, getter=isError) BOOL isError;

@end
