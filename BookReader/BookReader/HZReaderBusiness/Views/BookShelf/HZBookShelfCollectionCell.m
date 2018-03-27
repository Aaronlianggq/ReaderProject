//
//  HZBookShelfCollectionCell.m
//  BookReader
//
//  Created by lianggq on 2018/3/27.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZBookShelfCollectionCell.h"
#import "HZImageView.h"

@interface HZBookShelfCollectionCell()

@property (nonatomic,strong) HZImageView *bookImageView;

@end

@implementation HZBookShelfCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self setupViews];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

#pragma mark -
- (void)setBookInfo:(HZBookModel *)book {
    _bookImageView.image = [UIImage imageNamed:@"book"];
}

#pragma mark -
- (void)setupViews {
    _bookImageView = [[HZImageView alloc] init];
    _bookImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_bookImageView];
    
    [_bookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).inset(0.0);
    }];
}

@end



@interface HZBookShelfAddCell()

@property (nonatomic,strong) UIImageView *addImageView;

@end

@implementation HZBookShelfAddCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    _addImageView = [[UIImageView alloc] init];
    _addImageView.backgroundColor = [UIColor orangeColor];
    _addImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_addImageView];
    
    [_addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8.0 * SizeBit);
        make.right.equalTo(self.contentView).offset(-8.0 * SizeBit);
        make.top.equalTo(self.contentView).offset(3 * SizeBit);
        make.bottom.equalTo(self.contentView).offset(-6 * SizeBit);
    }];
}

@end



