//
//  MainViewController.m
//  bigbusiness
//
//  Created by zzy on 11/24/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "CollectViewController.h"
#import "MineViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface MainViewController ()<CLLocationManagerDelegate>
{
    UIButton *jobBtn;
    UIButton *myBtn;
    MineViewController *mineView;
    BOOL flag; //防止多次重复点击我的按钮
    NSString *cityName;
}
@property(nonatomic,strong)HomeViewController *homeView;
@property(nonatomic,strong)CLLocationManager *manager;
@end

@implementation MainViewController

- (HomeViewController *)homeView {

    if (!_homeView) {
        
        _homeView = [[HomeViewController alloc]init:self];
    }
    
    return _homeView;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.navigationItem setHidesBackButton:YES];
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.text = @"彩77";
    titleLbl.font = [UIFont systemFontOfSize:20];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLbl;
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"] == nil) {
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(quickClick:)];
        self.navigationItem.rightBarButtonItem.tag = 0;
    }
    
    else {
    
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(quickClick:)];
        self.navigationItem.rightBarButtonItem.tag = 1;
    }
    
    
    
    flag = YES;
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [self showNavgation:self];
}

- (void)reload:(NSNotification*) notification {

    [self jobClick];
}

- (void)quickClick:(UIBarButtonItem *)sender {

    LoginViewController *loginView = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    if (sender.tag == 1) {
        
        loginView.isHiddenNav = YES;
    }
    UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginView];
    [self presentViewController:loginNav animated:YES completion:nil];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"] != nil) {
        
        NSUserDefaults *defatluts = [NSUserDefaults standardUserDefaults];
        [defatluts removeObjectForKey:@"token"];
        [defatluts synchronize];
    }

}
- (void)initView {

    [self setBottom];
    
    [self.view addSubview:self.homeView.view];
    [self.homeView.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(jobBtn.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
}

- (void)setBottom {

    jobBtn = [[UIButton alloc]init];
    [self.view addSubview:jobBtn];
    jobBtn.backgroundColor = CustomColor(113, 3, 7);
    [jobBtn setTitle:@"主页" forState:UIControlStateNormal];
    [jobBtn addTarget:self action:@selector(jobClick) forControlEvents:UIControlEventTouchUpInside];
    [jobBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@45);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_left).with.offset(self.view.frame.size.width/2);
    }];
    
    myBtn = [[UIButton alloc]init];
    [myBtn setTitle:@"我的" forState:UIControlStateNormal];
    [myBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [myBtn addTarget:self action:@selector(myClick) forControlEvents:UIControlEventTouchUpInside];
    myBtn.backgroundColor = CustomColor(246, 246, 246);
    [self.view addSubview:myBtn];
    [myBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@45);
        make.left.equalTo(jobBtn.mas_right);
        make.right.equalTo(self.view.mas_right);
    }];
}

- (void)jobClick {

    [mineView.view removeFromSuperview];
    [self.view addSubview:self.homeView.view];
    [self.homeView.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(jobBtn.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];

    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.text = @"彩77";
    titleLbl.font = [UIFont systemFontOfSize:20];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLbl;
    
    [jobBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [myBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    myBtn.backgroundColor = CustomColor(246, 246, 246);
    jobBtn.backgroundColor = CustomColor(113, 3, 7);
    flag = YES;
    
}

- (void)myClick {

    if (!flag) {
        
        return;
    }
    
    flag = NO;
    
    [self.homeView.view removeFromSuperview];
    
    
    
    mineView = [[MineViewController alloc]init:self];
    [self.view addSubview:mineView.view];
    [mineView.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(jobBtn.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.text = @"我的";
    titleLbl.font = [UIFont systemFontOfSize:20];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLbl;
    myBtn.backgroundColor = CustomColor(113, 3, 7);
    jobBtn.backgroundColor = CustomColor(246, 246, 246);
    [myBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [jobBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
