//
//  HZBaseViewController.m
//  BookReader
//
//  Created by lianggq on 2018/3/16.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZBaseViewController.h"

@interface HZBaseViewController ()

@end

@implementation HZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self viewAdaptation];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)updateViewConstraints {
    
    if(!IOS11){
        //bottom 和 top放到动态里面设置
        CGFloat bottom = 0.0;
        if(self.tabBarController && !self.tabBarController.tabBar.hidden){
            bottom = CGRectGetHeight(self.tabBarController.tabBar.frame);
        }
        
        CGFloat top = 0.0;
        if(self.navigationController && self.navigationController.navigationBarHidden){
            top = 20.0;
        }
        
        [_baseView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(top);
            make.bottom.equalTo(self.view).offset(-bottom);
        }];
    }
    [super updateViewConstraints];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
}

#pragma mark --
- (void)viewAdaptation {
    self.edgesForExtendedLayout =  UIRectEdgeBottom ;
//    self.extendedLayoutIncludesOpaqueBars = NO;
//    self.modalPresentationCapturesStatusBarAppearance = NO;
    UIView *view = self.view;
    
    _baseView = [[HZBaseView alloc] init];
    _baseView.backgroundColor = self.view.backgroundColor;
    [view addSubview:_baseView];
    
    [_baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.edges.equalTo(view.mas_safeAreaLayoutGuide).inset(0.0);
        } else {
            make.left.equalTo(view).offset(0.0);
            make.right.equalTo(view).offset(0.0);
            
        }
    }];
    
    [self updateViewConstraints];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
