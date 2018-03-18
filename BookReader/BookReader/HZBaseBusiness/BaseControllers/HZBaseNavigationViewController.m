//
//  BaseNavigationViewController.m
//  BookReader
//
//  Created by lianggq on 2018/3/16.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZBaseNavigationViewController.h"

@interface HZBaseNavigationViewController ()<UINavigationControllerDelegate>

@end

@implementation HZBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
}




@end
