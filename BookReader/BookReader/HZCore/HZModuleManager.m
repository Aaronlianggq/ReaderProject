//
//  HZModuleManager.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZModuleManager.h"
#import "HZModule.h"

static NSMutableSet *ModuleClassSet;
void RegisterHZModule(Class moduleClass) {
    
    if (ModuleClassSet == nil) {
        
        ModuleClassSet = [[NSMutableSet alloc] init];
    }
    
    [ModuleClassSet addObject:moduleClass];
}

@interface HZModuleManager() {
    NSMutableDictionary *_modules;
}
@end

@implementation HZModuleManager
static HZModuleManager *instance;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HZModuleManager alloc] init];
    });
    
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

-(instancetype)copy {
    return [HZModuleManager sharedInstance];
}

- (instancetype)init {
    
    if (self = [super init]) {
        _modules = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - setUp

- (void)setUpAllModule {
    [self p_setupManagers];
}

- (void)p_setupManagers {
    
    [ModuleClassSet enumerateObjectsUsingBlock:^(Class clzz, BOOL *stop) {
        HZModule *module = [[clzz alloc] init];
        _modules[NSStringFromClass(clzz)] = module;
    }];
    
    [_modules.allValues enumerateObjectsUsingBlock:^(HZModule *module, NSUInteger idx, BOOL *stop) {
        [module setupWithContainer];
    }];
}

#pragma mark - tearDown

-(void)tearDownAllModule {
    [self p_teardownManagers];
}

- (void)p_teardownManagers {
    
    [_modules.allValues enumerateObjectsUsingBlock:^(HZModule *module, NSUInteger idx, BOOL *stop) {
        [module teardownWithContainer];
    }];
    
    [_modules removeAllObjects];
}

#pragma mark --modules
- (BookModule *)bookModule {
    return _modules[NSStringFromClass([BookModule class])];
}

@end
