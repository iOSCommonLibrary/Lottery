


//
//  KnowledgeDetailViewController.m
//  bigbusiness
//
//  Created by zzy on 1/3/17.
//  Copyright © 2017 zzy. All rights reserved.
//

#import "KnowledgeDetailViewController.h"

@interface KnowledgeDetailViewController ()

@end

@implementation KnowledgeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"彩票百科";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setContent:(NSString *)content {

    UILabel *introduceLbl = [[UILabel alloc]init];
    introduceLbl.numberOfLines = 0;
    introduceLbl.textColor = [UIColor darkGrayColor];
    introduceLbl.frame = CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width - 40, [UIScreen mainScreen].bounds.size.height);
    introduceLbl.text = content;
    [self.view addSubview:introduceLbl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
