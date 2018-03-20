//
//  UILabel+SizeCalculator.h
//  SkySea
//
//  Created by 翁阳 on 14/12/6.
//  Copyright (c) 2014年 skysea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SizeCalculator)

- (CGSize)c_sizeOfConstrained;

- (CGSize)c_sizeOfConstrainedWidth;

- (CGSize)c_sizeOfConstrainedHeight;

@end
