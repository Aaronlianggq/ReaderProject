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
    RegisterLoadHZModule([self class]);
}

#pragma mark --override
- (void)setupWithContainer {

}

- (void)teardownWithContainer {
    
}

#pragma mark --get
- (NSString *)getBookInfoUrl {
    if(!_getBookInfoUrl){
        _getBookInfoUrl = [HZ_Current_Host stringByAppendingString:@"book.json"];
    }
    return _getBookInfoUrl;
}

- (NSString *)getUserShelfBooksUrl {
    if(!_getUserShelfBooksUrl){
        _getUserShelfBooksUrl = [HZ_Current_Host stringByAppendingString:@"user/bookShelf.json"];
    }
    return _getUserShelfBooksUrl;
}

#pragma mark publick
- (void)getBookParams:(NSDictionary *)param
             callBack:(void (^)(HZBookModel *model))callback {

    [self->requestChannel get:self.getBookInfoUrl
                       params:param
                     callBack:^(HZResponse *response) {
                         id bookModel = nil;
                         if(!response.isError){
                             NSDictionary *body = response.body;
                             HZBookModel *model = [[HZBookModel alloc] init];
                             [model setParamsWithDictionary:body];
                             bookModel = model;
                         }
                         main_async_thread(^{
                             if(callback)
                                 callback(bookModel);
                         });
    }];
}

- (void)getUserShelfBooksParams:(NSDictionary *)param
                       callBack:(void (^)(NSArray<HZBookModel *> *bookModels))callback
{
    [self->requestChannel get:self.getBookInfoUrl
                       params:param
                     callBack:^(HZResponse *response) {
                         NSArray *bookModels = nil;
                         if(!response.isError){
                             NSArray *bodyArr = response.body;
                             bookModels = [HZBookModel getModelsWithArray:bodyArr];
                         }
                         main_async_thread(^{
                             if(callback)
                                 callback(bookModels);
                         });

    }];
}


@end
