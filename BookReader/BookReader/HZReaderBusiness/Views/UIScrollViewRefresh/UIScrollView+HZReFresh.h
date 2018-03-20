//
//  UIScrollView+HZReFresh.h
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, HZRefreshState) {

    HZRefreshStateIdle = 1,

    HZRefreshStatePulling ,

    HZRefreshStateRefreshing,

    HZRefreshStateWillRefresh,

    HZRefreshStateNoMoreData
};


@interface UIScrollView (HZReFresh)

- (void)addDefaultGitHeaderWithTarget:(id)target action:(SEL)sel;

- (void)addDefaultFooterWithTarget:(id)target action:(SEL)sel;

- (void)setHeaderTitle:(NSString *)title state:(HZRefreshState)state;

- (void)setFooterTitle:(NSString *)title state:(HZRefreshState)state;

@end
