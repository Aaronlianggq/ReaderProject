//
//  HZCentralManager.m
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZCentralManager.h"
#import "HZModule.h"
#import "HZServerAddressManager.h"

static HZCentralManager *_instance;
static NSMutableSet *ModuleClassSet;
void RegisterLoadHZModule(Class moduleClass) {
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
        [self p_setupManagerClass:clzz];
    }];
}

- (void)p_setupManagerClass:(Class)clzz {
    if(!_modules[NSStringFromClass(clzz)]){
        HZModule *module = [[clzz alloc] initWithCentralManager];
        _modules[NSStringFromClass(clzz)] = module;
        [module setupWithContainer];
    }
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
- (void)registerManager:(Class)managerClass {
    if(![ModuleClassSet containsObject:managerClass])
        [ModuleClassSet addObject:managerClass];
    
    [self p_setupManagerClass:managerClass];
}

- (id)managerForClass:(Class)managerClass {
    
    return _modules[NSStringFromClass(managerClass)];
}

- (HZServerAddressManager *)serverManger {
    return [self managerForClass:[HZServerAddressManager class]];
}

@end
