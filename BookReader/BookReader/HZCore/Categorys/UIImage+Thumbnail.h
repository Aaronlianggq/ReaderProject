//
//  UIImage+Thumbnail.h
//  SkySea
//
//  Created by 翁阳 on 14/12/23.
//  Copyright (c) 2014年 skysea. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Compress)(NSData *imageData);

@interface UIImage (Thumbnail)

- (UIImage *)c_thumbnailWithSize:(CGSize)size;

- (UIImage *)c_imageWithSize:(CGSize)size;
- (UIImage *)c_imageWithHalfSize;

- (void)c_compressWithFileSize:(NSUInteger)fileSize block:(Compress)block;

@end
