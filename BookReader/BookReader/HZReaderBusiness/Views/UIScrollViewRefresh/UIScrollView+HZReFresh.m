//
//  UIScrollView+HZReFresh.m
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "UIScrollView+HZReFresh.h"
#import "MJRefresh.h"

@implementation UIScrollView (HZReFresh)

- (void)addDefaultGitHeaderWithTarget:(id)target action:(SEL)sel {
    MJRefreshGifHeader *hzHeader = [MJRefreshGifHeader headerWithRefreshingTarget:target refreshingAction:sel];
    [hzHeader setImages:@[] forState:MJRefreshStateIdle];
    [hzHeader setImages:@[] forState:MJRefreshStateWillRefresh];
    [hzHeader setImages:@[] forState:MJRefreshStateRefreshing];
    self.mj_header = hzHeader;
}

- (void)addDefaultFooterWithTarget:(id)target action:(SEL)sel {
    MJRefreshAutoNormalFooter *hzFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:sel];

    self.mj_footer = hzFooter;
}

- (void)setHeaderTitle:(NSString *)title state:(HZRefreshState)state {
    
    if([self.mj_header isKindOfClass:[MJRefreshStateHeader class]]){
        MJRefreshStateHeader *self_header = (MJRefreshStateHeader *)self.mj_header;
        MJRefreshState mj_state = (MJRefreshState)state;
        [self_header setTitle:title forState:mj_state];
    }
}

- (void)setFooterTitle:(NSString *)title state:(HZRefreshState)state {
    
    if([self.mj_footer isKindOfClass:[MJRefreshAutoStateFooter class]]){
        MJRefreshAutoStateFooter *self_footer = (MJRefreshAutoStateFooter *)self.mj_footer;
        MJRefreshState mj_state = (MJRefreshState)state;
        [self_footer setTitle:title forState:mj_state];
    }
}

@end
