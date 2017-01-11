//
//  HomeTabBarController.m
//  bigbusiness
//
//  Created by zzy on 11/12/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "HomeTabBarController.h"
#import "HomeViewController.h"
#import "KeyViewController.h"
#import "SearchViewController.h"
#import "MineViewController.h"

@interface HomeTabBarController ()<UITabBarControllerDelegate>

@end

@implementation HomeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTabbar];
}


//设置tabBar
- (void)setTabbar {
  
    //首页
    HomeViewController *homeView = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeView];
    homeView.tabBarItem.title = @"首页";
    homeView.tabBarItem.image = [[UIImage imageNamed:@"communicaty_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeView.tabBarItem.selectedImage = [[UIImage imageNamed:@"communicaty_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //钥匙
    KeyViewController *keyView = [[KeyViewController alloc]init];
    UINavigationController *keyNav = [[UINavigationController alloc]initWithRootViewController:keyView];
    keyView.tabBarItem.title = @"钥匙";
    keyView.tabBarItem.image = [[UIImage imageNamed:@"lock_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    keyView.tabBarItem.selectedImage = [[UIImage imageNamed:@"lock_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //搜索
    SearchViewController *searchView = [[SearchViewController alloc]init];
    UINavigationController *searchNav = [[UINavigationController alloc]initWithRootViewController:searchView];
    searchView.tabBarItem.title = @"搜索";
    searchView.tabBarItem.image = [[UIImage imageNamed:@"ic_action_search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchView.tabBarItem.selectedImage = [[UIImage imageNamed:@"ic_action_search_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //我的
    MineViewController *mineView = [[MineViewController alloc]init];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineView];
    mineView.tabBarItem.title = @"我的";
    mineView.tabBarItem.image = [[UIImage imageNamed:@"mine_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineView.tabBarItem.selectedImage = [[UIImage imageNamed:@"mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSArray *controllers = [[NSArray alloc]initWithObjects:homeNav,keyNav,searchNav,mineNav,nil];
    self.tabBar.barTintColor = [UIColor whiteColor];
    [self setViewControllers:controllers animated:YES];
    self.delegate = self;
    self.selectedIndex = 0;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
