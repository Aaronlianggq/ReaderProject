//
//  UIImage+Thumbnail.m
//  SkySea
//
//  Created by 翁阳 on 14/12/23.
//  Copyright (c) 2014年 skysea. All rights reserved.
//

#import "UIImage+Thumbnail.h"

@implementation UIImage (Thumbnail)

- (UIImage *)c_thumbnailWithSize:(CGSize)size
{
    CGSize imageSize = CGSizeMake(floor(size.width * [UIScreen mainScreen].scale),
                                  floor(size.height * [UIScreen mainScreen].scale));
    
    
    if (self.size.width < imageSize.width || self.size.height < imageSize.height) {
        return self;
    }
    
//    UIGraphicsBeginImageContextWithOptions(imageSize, false, [[UIScreen mainScreen] scale]);
    UIGraphicsBeginImageContext(imageSize);
    
    [self drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}


- (UIImage *)c_imageWithSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)c_imageWithHalfSize
{
    CGSize size = CGSizeMake(self.size.width / 2, self.size.height / 2);
    return [self c_imageWithSize:size];
}

- (void)c_compressFileSize:(NSUInteger)fileSize
              startQuality:(CGFloat)startQuality
               stepQuality:(CGFloat)stepQuality
         limitSmallQuality:(CGFloat)limitSmallQuality
                     block:(Compress)block {

    NSAssert(fileSize > 0, @"image lenght must bt 0");
    
    __block NSData *imgData = nil;
    
    dispatch_async(dispatch_get_global_queue(0, 0),^{
            
        UIImage *image = self;
        
        // 先缩放宽高比例
        CGSize fitScreenSize = [self c_imageFitSizeScreen];
        
        if (fitScreenSize.width > 0 && fitScreenSize.height > 0) {
            
            image = [self c_imageWithSize:fitScreenSize];
        }
        
        // 再执行质量压缩
        imgData = UIImageJPEGRepresentation(image, 1.0);
        
        CGFloat quality = startQuality;
        while (imgData.length > fileSize) {
            
            @autoreleasepool {
                
                //                NSLog(@"==>>imgData:%ld quality:%lf", imgData.length, quality);
                quality -= stepQuality;
                
                if (quality < limitSmallQuality) break;
                
                imgData = UIImageJPEGRepresentation(image, quality);
            }
        }
            
        dispatch_async(dispatch_get_main_queue(), ^{
            block(imgData);
        });
    });
}

- (void)c_compressWithFileSize:(NSUInteger)fileSize block:(Compress)block {

    [self c_compressFileSize:fileSize startQuality:0.85 stepQuality:0.05 limitSmallQuality:0.1 block:block];
}

/**
  等比适应屏幕后的size,
  如果size小于屏幕返回CGSize(-1, -1)
 **/
- (CGSize)c_imageFitSizeScreen {
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat screenScale = [UIScreen mainScreen].scale;
    
    CGFloat imageWidth = self.size.width;
    CGFloat imageHeight = self.size.height;
    
    CGFloat maxWidth = screenSize.width;
    CGFloat maxHeight = screenSize.height;
    
    BOOL flag = NO;
    
    if (imageWidth > maxWidth) {
        
        imageHeight = maxWidth / imageWidth * imageHeight;
        imageWidth = maxWidth;
        
        flag = YES;
    }
    
    if (imageHeight > maxHeight) {
        
        imageWidth = maxHeight / imageHeight * imageWidth;
        imageHeight = maxHeight;
        
        flag = YES;
    }
    
    if (flag) {
        
        return CGSizeMake(imageWidth * screenScale, imageHeight * screenScale);
    }
    
    return CGSizeMake(-1, -1);
}

@end
