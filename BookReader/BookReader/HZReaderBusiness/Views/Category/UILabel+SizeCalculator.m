//
//  UILabel+SizeCalculator.m
//  SkySea
//
//  Created by 翁阳 on 14/12/6.
//  Copyright (c) 2014年 skysea. All rights reserved.
//

#import "UILabel+SizeCalculator.h"
#import "NSString+RectSize.h"

@implementation UILabel (SizeCalculator)

- (CGSize)c_sizeOfConstrained {
    
    CGSize size = [self.text textSizeWithFont:self.font constrainedToSize:self.frame.size];
    return size;
}

- (CGSize)c_sizeOfConstrainedWidth {

    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:@{NSFontAttributeName : self.font}
                                          context:nil];
    return rect.size;
}

- (CGSize)c_sizeOfConstrainedHeight {
    
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height)
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:@{NSFontAttributeName : self.font}
                                          context:nil];
    return rect.size;
}


@end
