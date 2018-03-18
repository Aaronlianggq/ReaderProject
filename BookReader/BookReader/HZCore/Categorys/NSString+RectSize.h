//
//  NSString+RectSize.h
//  NewProduct
//
//  Created by zqf on 13-8-12.
//  Copyright (c) 2013年 Lee. All rights reserved.
//  获取字符长度\高度

#import <UIKit/UIKit.h>

@interface NSString (RectSize)

/// 获取指定字体、最大宽度下的最佳size（普通文本）
- (CGSize)labelSizeWithWidth:(CGFloat)width font:(UIFont *)font;
/// 获取指定字体、最大高度下的最佳size（普通文本）
- (CGSize)labelSizeWithHeigth:(CGFloat)height font:(UIFont *)font;
/// 获取指定字体、指定size的最佳size
- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
@end
