//
//  UIView+HZExtension.m
//  BookReader
//
//  Created by lianggq on 2018/3/20.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "UIView+HZExtension.h"

@implementation UIView (HZExtension)


- (void)setHz_x:(CGFloat)Hz_x
{
    CGRect frame = self.frame;
    frame.origin.x = Hz_x;
    self.frame = frame;
}

- (CGFloat)Hz_x
{
    return self.frame.origin.x;
}

- (void)setHz_y:(CGFloat)Hz_y
{
    CGRect frame = self.frame;
    frame.origin.y = Hz_y;
    self.frame = frame;
}

- (CGFloat)Hz_y
{
    return self.frame.origin.y;
}

- (void)setHz_w:(CGFloat)Hz_w
{
    CGRect frame = self.frame;
    frame.size.width = Hz_w;
    self.frame = frame;
}

- (CGFloat)Hz_w
{
    return self.frame.size.width;
}

- (void)setHz_h:(CGFloat)Hz_h
{
    CGRect frame = self.frame;
    frame.size.height = Hz_h;
    self.frame = frame;
}

- (CGFloat)Hz_h
{
    return self.frame.size.height;
}

- (void)setHz_size:(CGSize)Hz_size
{
    CGRect frame = self.frame;
    frame.size = Hz_size;
    self.frame = frame;
}

- (CGSize)Hz_size
{
    return self.frame.size;
}

- (void)setHz_origin:(CGPoint)Hz_origin
{
    CGRect frame = self.frame;
    frame.origin = Hz_origin;
    self.frame = frame;
}

- (CGPoint)Hz_origin
{
    return self.frame.origin;
}

@end
