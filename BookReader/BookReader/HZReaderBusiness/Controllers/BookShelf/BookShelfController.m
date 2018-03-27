//
//  BookShelfController.m
//  BookReader
//
//  Created by lianggq on 2018/3/16.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "BookShelfController.h"
#import "HZBaseCollectionView.h"
#import "HZBookShelfCollectionCell.h"
#import "HZBookShelfCellFooter.h"
#import "HZBookShelfCellHeader.h"


@interface BookShelfController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) HZBaseCollectionView *collectionView;
@end

@implementation BookShelfController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"书架";
    [self setupViews];
}

- (void)setupViews {
    _collectionView = [[HZBaseCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    Class cellClass = [HZBookShelfCollectionCell class];
    Class addCellCls = [HZBookShelfAddCell class];
    [_collectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
    [_collectionView registerClass:addCellCls forCellWithReuseIdentifier:NSStringFromClass(addCellCls)];
    
    [_collectionView registerClass:[HZBookShelfCellHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HZBookShelfCellHeader class])];
    [_collectionView registerClass:[HZBookShelfCellFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([HZBookShelfCellFooter class])];
    [self.baseView addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.baseView).inset(0.0);
    }];
    
}

#pragma mark --delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    NSInteger row = indexPath.row;
    if(row < 2){
        Class cellClass = [HZBookShelfCollectionCell class];
        HZBookShelfCollectionCell *bookCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
        [bookCell setBookInfo:nil];
        cell = bookCell;
    }else{
        Class cellClass = [HZBookShelfAddCell class];
        HZBookShelfCollectionCell *addCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
        cell = addCell;
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *view = nil;
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HZBookShelfCellHeader class]) forIndexPath:indexPath];
        view.backgroundColor = [UIColor grayColor];
    }else{
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([HZBookShelfCellFooter class]) forIndexPath:indexPath];
        view.backgroundColor = [UIColor orangeColor];
    }
    return view;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark DelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger rowCount = 3; //一行显示3个
    CGFloat width = CGRectGetWidth(collectionView.bounds);
    CGFloat cellAllWidth = width - (2 * 15 * SizeBit) - ((rowCount-1) * 20 * SizeBit);//cell留下的总宽度
    CGFloat cellWidth = cellAllWidth / rowCount;
    CGFloat cellHeight = cellWidth * (142.0/116.0);
    return CGSizeMake(cellWidth, cellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    CGFloat pandding = 15 * SizeBit;
    return UIEdgeInsetsMake(25, pandding, 0, pandding);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 20 * SizeBit;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(CGRectGetWidth(collectionView.bounds), 105.0 * SizeBit);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(CGRectGetWidth(collectionView.bounds), 12.0 * SizeBit);
}



@end
