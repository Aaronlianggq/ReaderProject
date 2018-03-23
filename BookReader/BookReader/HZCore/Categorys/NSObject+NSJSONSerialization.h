//
//  NSObject+NSJSONSerialization.h
//  BookReader
//
//  Created by lianggq on 2018/3/23.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NSJSONSerialization)

@end

@interface NSString (NSJSONSerialization)
- (NSData *)hz_stringToData;
- (NSArray *)hz_stringToArray;
- (NSDictionary *)hz_stringToDictionary;
@end

@interface NSData (NSJSONSerialization)
- (NSString *)hz_dataToString;
- (NSArray *)hz_dataToArray;
- (NSDictionary *)hz_dataToDictionary;
@end

@interface NSArray (NSJSONSerialization)
- (NSData *)hz_arrayToData;
- (NSString *)hz_arrayToString ;
@end

@interface NSDictionary (NSJSONSerialization)
- (NSData *)hz_dictionaryToData;
- (NSString *)hz_dictionrayToString;
@end
