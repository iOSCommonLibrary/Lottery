//
//  MineViewController.m
//  bigbusiness
//
//  Created by zzy on 11/12/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "MineViewController.h"
#import "CollectViewController.h"
#import "CompanyIntroduceViewController.h"
#import "KnowledgeViewController.h"
@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
    NSMutableArray *titleArr;
    NSMutableArray *iconArr;
    BmobUser *bUser;
}
@property(nonatomic,strong)MainViewController *mainVC;
@end

@implementation MineViewController


- (id)init:(MainViewController *)mainVC {
    
    if ([super init]) {
        
        self.mainVC = mainVC;
        
        bUser = [BmobUser currentUser];
        
        
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"] == nil) {
            
            titleArr = [[NSMutableArray alloc]initWithObjects:@"彩票百科",@"登录",nil];
            iconArr = [[NSMutableArray alloc]initWithObjects:@"ic_action_emo_cool",@"ic_action_emo_angry", nil];
            
        }else {
            
            titleArr = [[NSMutableArray alloc]initWithObjects:@"彩票百科",@"我的收藏",@"退出账号", nil];
            iconArr = [[NSMutableArray alloc]initWithObjects:@"ic_action_emo_cool",@"ic_action_emo_cool",@"ic_action_emo_angry", nil];
            
        }
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)initView {

    [self setTable];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
}

- (void)setTable {

    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.tableFooterView = [[UIView alloc]init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identify"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identify"];
    }
   
        
    cell.imageView.image = [UIImage imageNamed:iconArr[indexPath.row]];
    
    cell.textLabel.text = titleArr[indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:NO];    
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"] == nil) {
        
        if (indexPath.row == 0) {
        
            KnowledgeViewController *vc = [[KnowledgeViewController alloc]init];
            [self.mainVC.navigationController pushViewController:vc animated:YES];
        }
        
        if (indexPath.row == 1) {
            
            LoginViewController *loginView = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            
            if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"] != nil) {
                
                loginView.isHiddenNav = YES;
            }
            
            UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginView];
            [self.mainVC presentViewController:loginNav animated:YES completion:nil];
            NSUserDefaults *defatluts = [NSUserDefaults standardUserDefaults];
            [defatluts removeObjectForKey:@"token"];
            [defatluts synchronize];
            
        }
    }else {
    
        if (indexPath.row == 0) {
            
            KnowledgeViewController *vc = [[KnowledgeViewController alloc]init];
            [self.mainVC.navigationController pushViewController:vc animated:YES];
        }
        
        if (indexPath.row == 1) {
            
            CollectViewController *collecView = [[CollectViewController alloc]init];
            [self.mainVC.navigationController pushViewController:collecView animated:YES];
        }
        
        
        if (indexPath.row == 2) {
            
            LoginViewController *loginView = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            
            if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"] != nil) {
                
                loginView.isHiddenNav = YES;
            }
            
            UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginView];
            [self.mainVC presentViewController:loginNav animated:YES completion:nil];
            NSUserDefaults *defatluts = [NSUserDefaults standardUserDefaults];
            [defatluts removeObjectForKey:@"token"];
            [defatluts synchronize];
        }
    }
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}


@end
