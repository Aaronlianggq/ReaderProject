//
//  UIView+HZExtension.m
//  BookReader
//
//  Created by lianggq on 2018/3/20.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "UIView+HZExtension.h"

@implementation UIView (HZExtension)


- (void)setHz_x:(CGFloat)hz_x
{
    CGRect frame = self.frame;
    frame.origin.x = hz_x;
    self.frame = frame;
}

- (CGFloat)hz_x
{
    return self.frame.origin.x;
}

- (void)setHz_y:(CGFloat)hz_y
{
    CGRect frame = self.frame;
    frame.origin.y = hz_y;
    self.frame = frame;
}

- (CGFloat)hz_y
{
    return self.frame.origin.y;
}

- (void)setHz_w:(CGFloat)hz_w
{
    CGRect frame = self.frame;
    frame.size.width = hz_w;
    self.frame = frame;
}

- (CGFloat)hz_w
{
    return self.frame.size.width;
}

- (void)setHz_h:(CGFloat)hz_h
{
    CGRect frame = self.frame;
    frame.size.height = hz_h;
    self.frame = frame;
}

- (CGFloat)hz_h
{
    return self.frame.size.height;
}

- (void)setHz_size:(CGSize)hz_size
{
    CGRect frame = self.frame;
    frame.size = hz_size;
    self.frame = frame;
}

- (CGSize)hz_size
{
    return self.frame.size;
}

- (void)setHz_origin:(CGPoint)hz_origin
{
    CGRect frame = self.frame;
    frame.origin = hz_origin;
    self.frame = frame;
}

- (CGPoint)hz_origin
{
    return self.frame.origin;
}

@end
