//
//  HZBookModuleManger.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZBookModuleManger.h"
@interface HZBookModuleManger()

@property (nonatomic,copy) NSString *getBookInfoUrl;

@property (nonatomic,copy) NSString *getUserShelfBooksUrl;

@end

@implementation HZBookModuleManger
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

- (void)getBookInfoUrlCallBack:(void (^)(BookModel *model))callback {
    
    [HZHttpSender httpDataGet:self.getBookInfoUrl params:nil callBack:^(HZResponse *response) {
        if(response.isError){
            callback(nil);
        }else{
            NSDictionary *body = response.body;
            BookModel *model = [[BookModel alloc] initWithDictionary:body];
            callback(model);
        }
    }];
}

- (void)getUserShelfBooksCallBack:(void (^)(NSArray<BookModel *> *bookModels))callback {
    [HZHttpSender httpDataGet:self.getUserShelfBooksUrl params:nil callBack:^(HZResponse *response) {
        if(response.isError){
            callback(nil);
        }else{
            NSArray *bodyArr = response.body;
            NSMutableArray *bookModels = [NSMutableArray arrayWithCapacity:bodyArr.count];
            for (NSDictionary *bookDic in bodyArr) {
                BookModel *model = [[BookModel alloc] initWithDictionary:bookDic];
                [bookModels addObject:model];
            }
            callback(bookModels);
        }
        
    }];
}


@end
