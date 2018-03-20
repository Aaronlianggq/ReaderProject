//
//  HZCentralManager.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZCentralManager.h"
#import "HZModule.h"

static NSMutableSet *ModuleClassSet;
void RegisterHZModule(Class moduleClass) {
    
    if (ModuleClassSet == nil) {
        
        ModuleClassSet = [[NSMutableSet alloc] init];
    }
    
    [ModuleClassSet addObject:moduleClass];
}

@interface HZCentralManager() {
    NSMutableDictionary *_modules;
    BOOL _isSetuped;
}
@end

@implementation HZCentralManager
static HZCentralManager *_instance;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (id)mutableCopy {
    return _instance;
}

+ (id)copyWithZone:(struct _NSZone *)zone  {
    return _instance;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return _instance;
}

-(instancetype)copy {
    return _instance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        _modules = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - setUp

- (void)setUpAllModule {
    @synchronized(self){
        if(!_isSetuped)
            [self p_setupManagers];
        
        _isSetuped = YES;
    }
}

- (void)p_setupManagers {
    
    [ModuleClassSet enumerateObjectsUsingBlock:^(Class clzz, BOOL *stop) {
        HZModule *module = [[clzz alloc] initWithCentralManager];
        _modules[NSStringFromClass(clzz)] = module;
    }];
    
    [_modules.allValues enumerateObjectsUsingBlock:^(HZModule *module, NSUInteger idx, BOOL *stop) {
        [module setupWithContainer];
    }];
    
}

#pragma mark - tearDown

-(void)tearDownAllModule {
    @synchronized(self){
        [self p_teardownManagers];
        _isSetuped = NO;
    }
}

- (void)p_teardownManagers {
    
    [_modules.allValues enumerateObjectsUsingBlock:^(HZModule *module, NSUInteger idx, BOOL *stop) {
        [module teardownWithContainer];
    }];
    
    [_modules removeAllObjects];
}

#pragma mark module manager
- (id)managerForClass:(Class)managerClass {
    
    return _modules[NSStringFromClass(managerClass)];
}

#pragma mark --modules
- (HZBookModuleManger *)bookModuleManger {
    return [self managerForClass:[HZBookModuleManger class]];
}

- (HZServerAddressManager *)serverManger {
    return [self managerForClass:[HZServerAddressManager class]];
}

@end
