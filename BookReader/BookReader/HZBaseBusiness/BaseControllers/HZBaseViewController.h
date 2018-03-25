//
//  HZBaseViewController.h
//  BookReader
//
//  Created by lianggq on 2018/3/16.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZBaseNavigationViewController.h"
#import "HZBaseView.h"

@interface HZBaseViewController : UIViewController

@property (nonatomic,weak) HZBaseNavigationViewController *hzNavigationController;

/// self.view
@property (nonatomic,strong,readonly) HZBaseView *baseView;

@end
