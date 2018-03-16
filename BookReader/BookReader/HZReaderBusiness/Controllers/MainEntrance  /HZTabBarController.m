//
//  HZTabBarController.m
//  BookReader
//
//  Created by lianggq on 2018/3/16.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "HZTabBarController.h"
#import "HZBaseNavigationViewController.h"
#import "BookShelfController.h"
#import "FeaturedAlbumController.h"
#import "ClassificationController.h"
#import "DisCoveryController.h"

@interface HZTabBarController ()

@end

@implementation HZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViewControllers];
}


- (void)setupViewControllers {
    
    
    HZBaseNavigationViewController *bkNaviVc = [self getNavContllerClass:[BookShelfController class] WithBarItemTitle:@"书架" imageName:@"bookSelf_nomal" selectedImageName:@"bookSelf_selected"];
    
    HZBaseNavigationViewController *faNaviVc = [self getNavContllerClass:[FeaturedAlbumController class] WithBarItemTitle:@"精选" imageName:@"bookSelf_nomal" selectedImageName:@"bookSelf_selected"];
    
    HZBaseNavigationViewController *cfNaviVc = [self getNavContllerClass:[ClassificationController class] WithBarItemTitle:@"分类" imageName:@"bookSelf_nomal" selectedImageName:@"bookSelf_selected"];
    
    HZBaseNavigationViewController *disCNaviVc = [self getNavContllerClass:[DisCoveryController class] WithBarItemTitle:@"发现" imageName:@"bookSelf_nomal" selectedImageName:@"bookSelf_selected"];
    
    self.viewControllers = [NSArray arrayWithObjects:bkNaviVc,faNaviVc,cfNaviVc,disCNaviVc, nil];
    
}

- (HZBaseNavigationViewController *)getNavContllerClass:(Class)class
                            WithBarItemTitle:(NSString *)title
                                   imageName:(NSString *)name
                           selectedImageName:(NSString *)selectedName {
    
    UIViewController *vc = [[class alloc] init];
    HZBaseNavigationViewController *navi = [[HZBaseNavigationViewController alloc] initWithRootViewController:vc];
    navi.tabBarItem.title = title;
    navi.tabBarItem.image = [UIImage imageNamed:name];
    navi.tabBarItem.selectedImage = [UIImage imageNamed:selectedName];
    [navi.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
    [navi.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [navi.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0]} forState:UIControlStateNormal];
    return navi;
}

@end
