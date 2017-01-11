//
//  CompanyIntroduceViewController.m
//  bigbusiness
//
//  Created by zzy on 12/29/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "CompanyIntroduceViewController.h"

@interface CompanyIntroduceViewController ()

@end

@implementation CompanyIntroduceViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = CustomColor(240, 238, 241);
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.text = @"简介";
    titleLbl.font = [UIFont systemFontOfSize:20];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLbl;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"ic_action_arrow_left"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
}

- (void)backClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)initView {

    [self setContent];
}

- (void)setContent {

    UILabel *contentLbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width - 10, self.view.frame.size.height - 40)];
    contentLbl.numberOfLines = 0;
    contentLbl.font = [UIFont systemFontOfSize:14];
    [contentLbl setTextColor:[UIColor blackColor]];
    contentLbl.text = @"    巨业网隶属于南京巨业科技有限公司，2015年12月21日正式上线运行，总部坐落于风景秀丽、龙盘虎踞的六朝古都南京，是一家专业服务于大众求职者的求职招聘网站。我们秉承“资源共享、服务大众”的理念，为大众求职者提供最优质、最全面、最便捷的求职应聘全套解决方案，帮助大众求职者以最快速度解决就业问题。巨业网开创全新的平台运营模式，以大众求职者为中心，创新推出了“一站式就业”免费服务项目，使求职者与招聘单位直接对接，获得就业机会，免除了找工作去中介机构的烦恼，使大众求职者放心选择、安心就业。在此基础上，巨业网推出“就业补助金”服务项目，通过巨业网网站和app平台成功就业的求职者，只要在就业单位工作满足一定时限，即可获得巨业网提供的“就业补助金”，边找工作边赚钱，开开心心找工作，解除求职者的一切后顾之忧。";
    [self.view addSubview:contentLbl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
