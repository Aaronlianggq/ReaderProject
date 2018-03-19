//
//  HZTabBarController.h
//  BookReader
//
//  Created by lianggq on 2018/3/16.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGQSideViewController.h"

@interface HZTabBarController : UITabBarController
@property (nonatomic,weak) LGQSideViewController *sideViewController;
@end
