//
//  HomeTableSource.h
//  bigbusiness
//
//  Created by zzy on 11/14/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeViewController.h"
#import "MainViewController.h"
@interface HomeTableSource : NSObject<UITableViewDataSource,UITableViewDelegate>
- (id)init:(UITableView *)table mainVC:(MainViewController *)mainVC;
@property(nonatomic,strong)NSMutableArray *arrJobModel;
@property(nonatomic,strong)NSString *workAreaType; //工作地区
@property(nonatomic,strong)NSMutableArray *jobWelfareArr; //福利数组
@property(nonatomic,strong)NSString *companyName; //公司名称
@property(nonatomic,strong)NSString *jobType; //工作类型
@end
