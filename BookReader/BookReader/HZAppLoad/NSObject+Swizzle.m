//
//  NSObject+Swizzle.m
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@interface NSObject (Swizzle)

+ (void)swizzleClassMethod:(Class)classname originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector;
+ (void)swizzleInstanceMethod:(Class)classname originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector;

@end

@implementation NSObject (Swizzle)

#pragma mark - swizzle method

+ (void)swizzleClassMethod:(Class)classname originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getClassMethod(classname, otherSelector);
    Method originMehtod = class_getClassMethod(classname, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

+ (void)swizzleInstanceMethod:(Class)classname originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getInstanceMethod(classname, otherSelector);
    Method originMehtod = class_getInstanceMethod(classname, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

@end


@implementation NSArray (Swizzle)

+ (void)load {
    
    if (NSClassFromString(@"NSArray")) {
        
        SEL originalSelector = @selector(objectAtIndex:);
        SEL swizzledSelector = @selector(swizzled_objectAtIndex:);
        
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayI") originSelector:originalSelector otherSelector:swizzledSelector];
    }
}

- (id)swizzled_objectAtIndex:(NSUInteger)index {
    
    if ([self count] <= index) {
#ifdef DEBUG
        NSAssert(NO, @"index %ld > count %ld", (long)index, (long)(self.count));
#else
        return nil;
#endif
        
    }
    return [self swizzled_objectAtIndex:index];
}

@end


@implementation NSMutableDictionary (Swizzle)

+ (void)load {
    
    [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryM") originSelector:@selector(setObject:forKey:) otherSelector:@selector(swizzled_setObject:forKey:)];
}

- (void)swizzled_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    if (anObject == nil || aKey == nil) {
#ifdef DEBUG
        NSAssert(NO, @"key and content can't be nil for %@",NSStringFromClass([self class]));
#else
    
#endif
        return;
    }
    [self swizzled_setObject:anObject forKey:aKey];
}

@end

