//
//  UIImageView+HZImageLoad.h
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HZImageCacheType) {
    HZImageCacheTypeNone,
    HZImageCacheTypeDisk,
    HZImageCacheTypeMemory
};

typedef NS_OPTIONS(NSUInteger, HZImageOptions) {
    HZImageRetryFailed = 1 << 0,
    HZImageLowPriority = 1 << 1,
    HZImageCacheMemoryOnly = 1 << 2,
    HZImageProgressiveDownload = 1 << 3,
    HZImageRefreshCached = 1 << 4,
    HZImageContinueInBackground = 1 << 5,
    HZImageHandleCookies = 1 << 6,
    HZImageAllowInvalidSSLCertificates = 1 << 7,
    HZImageHighPriority = 1 << 8,
    HZImageDelayPlaceholder = 1 << 9,
    HZImageTransformAnimatedImage = 1 << 10,
    HZImageAvoidAutoSetImage = 1 << 11,
    HZImageScaleDownLargeImages = 1 << 12,
    HZImageQueryDataWhenInMemory = 1 << 13,
    HZImageQueryDiskSync = 1 << 14,
    HZImageFromCacheOnly = 1 << 15,
    HZImageForceTransition = 1 << 16
};

@interface UIImageView (HZImageLoad)

- (void)hz_setImageWithURL:(nullable NSURL *)url;

- (void)hz_setImageWithURL:(nullable NSURL *)url
                 completed:(void (^_Nullable)(UIImage * _Nullable image, NSError * _Nullable error, HZImageCacheType cacheType,NSURL * _Nullable imageURL))completedBlock ;

- (void)hz_setImageWithURL:(nullable NSURL *)url
          placeholderImage:(nullable UIImage *)placeholder;

- (void)hz_setImageWithURL:(nullable NSURL *)url
          placeholderImage:(nullable UIImage *)placeholder
                 completed:(void (^_Nullable)(UIImage * _Nullable image, NSError * _Nullable error, HZImageCacheType cacheType,NSURL * _Nullable imageURL))completedBlock;

- (void)hz_setImageWithURL:(nullable NSURL *)url
          placeholderImage:(nullable UIImage *)placeholder
                   options:(HZImageOptions)options
                  progress:(void(^_Nullable)(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL))progressBlock
                 completed:(void (^_Nullable)(UIImage * _Nullable image, NSError * _Nullable error, HZImageCacheType cacheType,NSURL * _Nullable imageURL))completedBlock;

@end
