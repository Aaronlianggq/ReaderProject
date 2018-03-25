//
//  UIView+HZExtension.h
//  BookReader
//
//  Created by lianggq on 2018/3/20.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "HZDefineConfig.h"

@interface UIView (HZExtension)

@property (assign, nonatomic) CGFloat hz_x;
@property (assign, nonatomic) CGFloat hz_y;
@property (assign, nonatomic) CGFloat hz_w;
@property (assign, nonatomic) CGFloat hz_h;
@property (assign, nonatomic) CGSize  hz_size;
@property (assign, nonatomic) CGPoint hz_origin;

@end
