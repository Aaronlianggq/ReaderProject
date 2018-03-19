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
- (void)getBookInfoUrlCallBack:(void (^)(NSObject<HZModuleModelProtocol> *model))callback
             withProtocalClass:(Class)classModel{
    if(![self isClassToModuleProtocal:classModel]){
        return;
    }
    
    [self->requestChannel get:self.getBookInfoUrl
                       params:nil
                     callBack:^(HZResponse *response) {
                         
        if(response.isError){
            callback(nil);
        }else{
            NSDictionary *body = response.body;
            NSObject <HZModuleModelProtocol> *model = [[classModel alloc] init];

            [model setParamsWithDictionary:body];
            
            mainThread(^{
                callback(model);
            });
        }
    }];
}

- (void)getUserShelfBooksCallBack:(void (^)(NSArray<NSObject<HZModuleModelProtocol> *> *bookModels))callback
                withProtocalClass:(Class)classModel {
    if(![self isClassToModuleProtocal:classModel]){
        return;
    }
    
    [self->requestChannel get:self.getBookInfoUrl
                       params:nil
                     callBack:^(HZResponse *response) {
        if(response.isError){
            callback(nil);
        }else{
            NSArray *bodyArr = response.body;
            NSArray *bookModels = [classModel getModelsWithArray:bodyArr];
            mainThread(^{
                callback(bookModels);
            });
        }

    }];
}


@end
