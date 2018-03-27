//
//  HZBookShelfCollectionCell.h
//  BookReader
//
//  Created by lianggq on 2018/3/27.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZBaseCollectionView.h"
#import "HZBookModel.h"

@interface HZBookShelfCollectionCell : HZBaseCollectionCell
- (void)setBookInfo:(HZBookModel *)book;
@end

@interface HZBookShelfAddCell : HZBaseCollectionCell
@end
