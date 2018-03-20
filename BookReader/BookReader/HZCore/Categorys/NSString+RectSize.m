//
//  NSString+RectSize.m
//  NewProduct
//
//  Created by zqf on 13-8-12.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "NSString+RectSize.h"

@implementation NSString (RectSize)

// 计算显示文字需要的矩形尺寸
- (CGSize)sizeWithWidth:(CGFloat)width font:(UIFont *)font
{
    CGSize maxSize = CGSizeMake(width, CGFLOAT_MAX);
    CGSize expectedSize =CGSizeZero;

    NSDictionary *fontDict = @{NSFontAttributeName:font};
    expectedSize = [self boundingRectWithSize:maxSize
                                      options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                   attributes:fontDict
                                      context:nil].size;
    //expectedSize.height *= 1.035;

    return expectedSize;
}


- (CGSize)sizeWithHeigth:(CGFloat)height font:(UIFont *)font
{
    CGSize maxSize = CGSizeMake(CGFLOAT_MAX, height);
    CGSize expectedSize =CGSizeZero;

    NSDictionary *fontDict = @{NSFontAttributeName:font};
    expectedSize = [self boundingRectWithSize:maxSize
                                      options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                   attributes:fontDict
                                      context:nil].size;
        //expectedSize.width *= 1.035;
    return expectedSize;
}

- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    CGSize textSize;
    if (CGSizeEqualToSize(size, CGSizeZero)){

        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];

        textSize = [self sizeWithAttributes:attributes];
    }else{
        NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        //NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（译者注：字体大小+行间距=行高）
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        CGRect rect = [self boundingRectWithSize:size
                                         options:option
                                      attributes:attributes
                                         context:nil];
        
        textSize = rect.size;
    }
    
    return textSize;
}

@end
