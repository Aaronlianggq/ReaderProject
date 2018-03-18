//
//  BookModule.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "BookModule.h"
@interface BookModule()

@property (nonatomic,copy) NSString *getBookInfoUrl;

@end

@implementation BookModule

+ (void)load {
    RegisterHZModule([self class]);
}

#pragma mark --override
- (void)setupWithContainer {
    
}

- (void)teardownWithContainer {
    
}

#pragma mark --get
- (NSString *)getBookInfoUrl {
    return @"";
}

- (void)getBookInfoUrl:(NSString *)url
              callBack:(HZTTPResponseBlock)callback {
    
    
    [HZHttpSender httpDataGet:url params:nil callBack:^(HZResponse *response) {
        
    }];
    
}


@end
