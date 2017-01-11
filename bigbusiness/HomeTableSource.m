//
//  HomeTableSource.m
//  bigbusiness
//
//  Created by zzy on 11/14/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "HomeTableSource.h"
#import "HomeTableViewCell.h"
#import "JobModel.h"
#import "ConvertDate.h"
#import "UITableView+EmptyData.h"
#import "CSWebviewControllerViewController.h"

@interface HomeTableSource ()

@property(nonatomic,strong)MainViewController *mainVC;
@property(nonatomic,assign)NSInteger count;
/** <##> */
@property(copy,nonatomic)NSString *sqlstr;
@end

@implementation HomeTableSource

- (id)init:(UITableView *)table mainVC:(MainViewController *)mainVC {

    if ([super init]) {
        
        self.arrJobModel = [[NSMutableArray alloc]init];
        self.mainVC = mainVC;
        [self upAndDownDrag:table];
        //查询数组中包含某个元素的记录
        BmobQuery *query = [BmobQuery queryWithClassName:@"Lottery"];
        [query orderByAscending:@"createdAt"];
        
        [query setLimit:10];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:table animated:YES];
        hud.label.text = @"Loading";
        [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            [hud hideAnimated:YES];
            if (error) {
                
                NSLog(@"%@",error);
            } else {
                
                for (BmobObject *obj in array) {
                    
                    JobModel *jobModel = [[JobModel alloc]init];
                    jobModel.objectId = [obj objectForKey:@"objectId"];
                    jobModel.createdAt = [obj objectForKey:@"createdAt"];
                    jobModel.title = [obj objectForKey:@"title"];
                    jobModel.type = [obj objectForKey:@"type"];
                    jobModel.result = [obj objectForKey:@"result"];
                    jobModel.date = [obj objectForKey:@"date"];
                    [self.arrJobModel addObject:jobModel];
                }
                self.count = array.count;
                [table reloadData];
            }
        }];
        
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section; {

    [tableView tableViewDisplayWitMsg:@"暂无数据" ifNecessaryForRowCount:self.arrJobModel.count];
    
    return self.arrJobModel.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identify"];
    
    if (!cell) {
        
        cell = [[HomeTableViewCell alloc]init:UITableViewCellStyleValue1 reuseIdentifier:@"identify" leftSpace:0];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    JobModel *model = self.arrJobModel[indexPath.row];
    
    if (model.type.length > 2) {
        
        cell.iconLbl.font = [UIFont systemFontOfSize:12];
    }
    
    else {
    
        cell.iconLbl.font = [UIFont systemFontOfSize:15];
    }
    cell.iconLbl.text = model.type;
    cell.iconLbl.textAlignment = NSTextAlignmentCenter;
    
    cell.iconLbl.textColor = [UIColor whiteColor];
    cell.bigLbl.text = model.title;
    cell.dateLbl.text = model.date;
    
    NSArray *arr = [model.result componentsSeparatedByString:@","];
    
    cell.smallLbl1.text = arr[0];
    cell.smallLbl1.font = [UIFont systemFontOfSize:12];
    
    cell.smallLbl2.text = arr[1];
    cell.smallLbl2.font = [UIFont systemFontOfSize:12];
    
    cell.smallLbl3.text = arr[2];
    cell.smallLbl3.font = [UIFont systemFontOfSize:12];
    
    cell.smallLbl4.text = arr[3];
    cell.smallLbl4.font = [UIFont systemFontOfSize:12];
    
    cell.smallLbl5.text = arr[4];
    cell.smallLbl5.font = [UIFont systemFontOfSize:12];
    
    cell.smallLbl6.text = arr[5];
    cell.smallLbl6.font = [UIFont systemFontOfSize:12];
    
    cell.smallLbl7.text = arr[6];
    cell.smallLbl7.font = [UIFont systemFontOfSize:12];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewRowAction *deleteRowAction = nil;
    JobModel *model = self.arrJobModel[indexPath.row];
    [DataBaseOperation createSql];
    NSString *sql = [NSString stringWithFormat:@"select *from tb_collect where job_id = '%@';",model.objectId];
    FMResultSet *set = [DataBaseOperation getQuery:sql];
    if ([set next]) {//如果已经收藏
        
        //设置删除按钮
        deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"取消收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            
            if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"] == nil) {
            
                LoginViewController *loginView = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
                UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginView];
                [self.mainVC presentViewController:loginNav animated:YES completion:nil];
                NSUserDefaults *defatluts = [NSUserDefaults standardUserDefaults];
                [defatluts removeObjectForKey:@"token"];
                [defatluts synchronize];
                
            }else {
            
                self.sqlstr = [NSString stringWithFormat:@"delete from tb_collect where job_id = '%@';",model.objectId];
                if ([DataBaseOperation Operation:self.sqlstr]) {
                    
                    [SVProgressHUD showSuccessWithStatus:@"取消收藏成功！"];
                    [tableView reloadData];
                }
            }
            
           
        }];
        
    }else {
        
        deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            
            if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"] == nil) {
            
                LoginViewController *loginView = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
                UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginView];
                [self.mainVC presentViewController:loginNav animated:YES completion:nil];
                NSUserDefaults *defatluts = [NSUserDefaults standardUserDefaults];
                [defatluts removeObjectForKey:@"token"];
                [defatluts synchronize];
                
            }else {
            
                self.sqlstr = [NSString stringWithFormat:@"insert into tb_collect(job_id) values ('%@');",model.objectId];
                if ([DataBaseOperation Operation:self.sqlstr]) {
                    
                    [SVProgressHUD showSuccessWithStatus:@"收藏成功！"];
                    [tableView reloadData];
                }
            }
            
        }];
    }
    
    
    return @[deleteRowAction];
}

//上拉，下拉
- (void)upAndDownDrag:(UITableView *)table {
    
    //下拉刷新
    table.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //查询数组中包含某个元素的记录
        BmobQuery *query = [BmobQuery queryWithClassName:@"Lottery"];

        [query orderByAscending:@"createdAt"];
        
        
        [query setLimit:10];

        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:table animated:YES];
        hud.label.text = @"Loading";
        [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            [hud hideAnimated:YES];
            [table.mj_header endRefreshing];
            if (error) {
                
                NSLog(@"%@",error);
            } else {
                
                [self.arrJobModel removeAllObjects];
                for (BmobObject *obj in array) {
                    
                    JobModel *jobModel = [[JobModel alloc]init];
                    jobModel.objectId = [obj objectForKey:@"objectId"];
                    jobModel.createdAt = [obj objectForKey:@"createdAt"];
                    jobModel.title = [obj objectForKey:@"title"];
                    jobModel.type = [obj objectForKey:@"type"];
                    jobModel.result = [obj objectForKey:@"result"];
                    jobModel.date = [obj objectForKey:@"date"];
                    [self.arrJobModel addObject:jobModel];
                }
                self.count = array.count;
                [table reloadData];
            }
        }];

        
    }];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    table.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉加载更多
    table.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //查询数组中包含某个元素的记录
        BmobQuery *query = [BmobQuery queryWithClassName:@"Lottery"];


        
        [query setLimit:10];
        [query orderByAscending:@"createdAt"];
        [query setSkip:self.count];
        [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            [table.mj_footer endRefreshing];
            if (error) {
                NSLog(@"%@",error);
                return;
            } else {
                
                for (BmobObject *obj in array) {
                    JobModel *jobModel = [[JobModel alloc]init];
                    jobModel.objectId = [obj objectForKey:@"objectId"];
                    jobModel.createdAt = [obj objectForKey:@"createdAt"];
                    jobModel.title = [obj objectForKey:@"title"];
                    jobModel.type = [obj objectForKey:@"type"];
                    jobModel.result = [obj objectForKey:@"result"];
                    jobModel.date = [obj objectForKey:@"date"];
                    [self.arrJobModel addObject:jobModel];
                    
                }
                self.count = self.count + array.count;
                [table reloadData];
            }
        }];

        
    }];
}
@end
