//
//  HZBaseTableView.m
//  BookReader
//
//  Created by lianggq on 2018/3/16.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZBaseTableView.h"

@implementation HZBaseTableView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self defaultProperty];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    [self defaultProperty];
    return self;
}

- (void)defaultProperty {

}


@end


@implementation HZBaseTableCell
@end;
