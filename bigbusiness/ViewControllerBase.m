//
//  ViewControllerBase.m
//  HeXin
//
//  Created by zzy on 9/22/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "ViewControllerBase.h"


@interface ViewControllerBase ()
@property(nonatomic,strong)MBProgressHUD *hub;
@end

@implementation ViewControllerBase

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initView];
    [self onLoad];
}


- (void)initView {

    
}


- (void)onLoad {

}



//显示加载进度
- (void)showProgress: (NSString *)msg {

    self.hub = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hub.labelText = msg;
}


//隐藏加载进度
- (void)hiddenProgress {

    self.hub.hidden = YES;
}

//显示底部tabbar
- (void)showTabBar:(UIViewController *)sender {

    sender.tabBarController.tabBar.hidden = NO;
}

//隐藏底部tabbar
- (void)hiddenTabBar:(UIViewController *)sender {

    sender.tabBarController.tabBar.hidden = YES;
}


//显示导航条
- (void)showNavgation:(UIViewController *)sender {

    sender.navigationController.navigationBarHidden = NO;
}

//隐藏导航条
- (void)hiddenNavgation:(UIViewController *)sender {

     sender.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
