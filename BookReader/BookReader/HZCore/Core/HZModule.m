//
//  HZModule.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModule.h"

@interface HZModule()
@end

@implementation HZModule


/**
 由中央管理器创建

 @return nil
 */
- (id)init
{
    [self doesNotRecognizeSelector:@selector(init)];
    return nil;
}


- (void)setupWithContainer {}
- (void)teardownWithContainer {}


@end

