//
//  DefineConfig.h
//  BookReader
//
//  Created by lianggq on 2018/3/18.
//  Copyright © 2018年 liang. All rights reserved.
//



#ifndef DefineConfig_h
#define DefineConfig_h

// DEBUG_LOG
#ifdef DEBUG
# define HZDEBUG_LOG(fmt, ...) NSLog(fmt, ##__VA_ARGS__)
# define HZDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
# define HZDEBUG_LOG(fmt, ...)
# define HZLog(fmt, ...)
#endif

//system

#define IOS8 ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
#define IOS9 ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0)
#define IOS10 ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0)
#define IOS11 ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0)

#define Is_Phone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define Is_PhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define HZAppScale  MAX([[UIScreen mainScreen] scale],2) //设备分辨率  最小2x图
#define HZScreenBound [UIScreen mainScreen].bounds
#define HZAppInfoDictionary  [[NSBundle mainBundle] infoDictionary]  //app应用数据

// 获取RGB颜色
#define HZRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define HZRGB(r,g,b) RGBA(r,g,b,1.0f)
//16进制颜色
#define HZColorHex(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:1.0]
#define HZColorHexA(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:(a)]

/** 弱引用 */
#define WS __weak typeof(self) weakSelf = self;
#define WeakObj(obj) __weak typeof(obj) weakObj = obj;

/** 强引用 */
#define SWS __weak typeof(weakSelf) strongSelf = weakSelf;
#define StrongObj(obj) __strong typeof(obj) strongObj = obj;


#endif /* DefineConfig_h */
