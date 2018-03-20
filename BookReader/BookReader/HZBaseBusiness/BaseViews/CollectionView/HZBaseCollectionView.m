//
//  HZBaseCollectionView.m
//  BookReader
//
//  Created by lianggq on 2018/3/16.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZBaseCollectionView.h"

@implementation HZBaseCollectionView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self defaultProperty];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    [self defaultProperty];
    return self;
}

- (void)defaultProperty {
    self.alwaysBounceVertical = YES;
}
@end

@implementation HZBaseCollectionCell
@end;
