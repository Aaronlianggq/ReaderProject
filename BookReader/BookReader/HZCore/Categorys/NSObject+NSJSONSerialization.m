//
//  NSObject+NSJSONSerialization.m
//  BookReader
//
//  Created by lianggq on 2018/3/23.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "NSObject+NSJSONSerialization.h"

@implementation NSObject (NSJSONSerialization)

- (void)hz_logSerializationError:(NSError *)error{
#ifdef DEBUG
    NSLog(@"Serialization error = %@",error);
#endif
}

@end

@implementation NSString (NSJSONSerialization)

- (NSData *)hz_stringToData {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSArray *)hz_stringToArray{
    NSData *data = [self hz_stringToData];
    return [data hz_dataToArray];
}

- (NSDictionary *)hz_stringToDictionary{
    NSData *data = [self hz_stringToData];
    return [data hz_dataToDictionary];
}

@end

@implementation NSData (NSJSONSerialization)
- (NSString *)hz_dataToString {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSArray *)hz_dataToArray {
    NSArray *array = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:nil];
    if([array isKindOfClass:[NSArray class]])
        return array;
    
    return nil;
}

- (NSDictionary *)hz_dataToDictionary{
    NSDictionary *dictionray = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:nil];
    if([dictionray isKindOfClass:[NSDictionary class]])
        return dictionray;
    
    return nil;
}
@end

@implementation NSArray (NSJSONSerialization)

- (NSData *)hz_arrayToData {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                            options:NSJSONWritingPrettyPrinted
                                              error:&error];
    if(error){
        [self hz_logSerializationError:error];
    }
    return data;
}

- (NSString *)hz_arrayToString {
    NSData *data = [self hz_arrayToData];
    return [data hz_dataToString];
}

@end

@implementation NSDictionary (NSJSONSerialization)

- (NSData *)hz_dictionaryToData {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    if(error){
        [self hz_logSerializationError:error];
    }
    return data;
}

- (NSString *)hz_dictionrayToString {
    NSData *data = [self hz_dictionaryToData];
    return [data hz_dataToString];
}

@end

