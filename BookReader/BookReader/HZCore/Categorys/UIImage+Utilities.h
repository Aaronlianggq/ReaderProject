//
//  UIImage+Utilities.h
//  
//
//  Created by zqf on 13-9-10.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utilities)


///通过颜色创建图片
+(UIImage *)createImageWithColor:(UIColor *)color;

/// 等比缩放图片
- (UIImage *)scaleToSize:(CGSize)newSize;

/// 取正方向
- (UIImage *)fixOrientation;

///修改image的size
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

///取图片的主要颜色 当图片主要颜色是clear or white 返回后自己处理
-(UIColor*)mostColor;

//修改图片颜色 为指定颜色...
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;

//修改图片颜色 为指定颜色...并带有填充色 常用
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;

//修改图片颜色 type 1灰  2取反  3白  其他无
- (UIImage*)grayscaleType:(int)type ;




@end
