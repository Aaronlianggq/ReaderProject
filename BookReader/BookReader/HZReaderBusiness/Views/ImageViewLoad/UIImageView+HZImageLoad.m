//
//  UIImageView+HZImageLoad.m
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "UIImageView+HZImageLoad.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (HZImageLoad)

- (void)hz_setImageWithURL:(NSURL *)url {
    [self sd_setImageWithURL:url];
}

- (void)hz_setImageWithURL:(nullable NSURL *)url
                 completed:(void (^)(UIImage * _Nullable image, NSError * _Nullable error, HZImageCacheType cacheType,NSURL * _Nullable imageURL))completedBlock {
    SDExternalCompletionBlock sd_completedBlock = (SDExternalCompletionBlock)completedBlock;
    [self sd_setImageWithURL:url completed:sd_completedBlock];
}

- (void)hz_setImageWithURL:(nullable NSURL *)url
          placeholderImage:(nullable UIImage *)placeholder {
    [self sd_setImageWithURL:url placeholderImage:placeholder];
}

- (void)hz_setImageWithURL:(nullable NSURL *)url
          placeholderImage:(nullable UIImage *)placeholder
                 completed:(void (^)(UIImage * _Nullable image, NSError * _Nullable error, HZImageCacheType cacheType,NSURL * _Nullable imageURL))completedBlock {
    SDExternalCompletionBlock sd_completedBlock = (SDExternalCompletionBlock)completedBlock;
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:sd_completedBlock];
}

- (void)hz_setImageWithURL:(nullable NSURL *)url
          placeholderImage:(nullable UIImage *)placeholder
                   options:(HZImageOptions)options
                  progress:(void(^)(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL))progressBlock
                 completed:(void (^)(UIImage * _Nullable image, NSError * _Nullable error, HZImageCacheType cacheType,NSURL * _Nullable imageURL))completedBlock {
    SDWebImageOptions sd_options = (SDWebImageOptions)options;
    SDExternalCompletionBlock sd_completedBlock = (SDExternalCompletionBlock)completedBlock;
    [self sd_setImageWithURL:url
                    placeholderImage:placeholder
                             options:sd_options
                            progress:progressBlock
                   completed:sd_completedBlock];
}


@end
