//
//  CollectViewController.m
//  bigbusiness
//
//  Created by zzy on 11/23/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "CollectViewController.h"
#import "HomeTableViewCell.h"
#import "JobModel.h"


@interface CollectViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
    
}
@property(nonatomic,strong)NSMutableArray *arrJobModel;
//@property(nonatomic,strong)MainViewController *mainVC;
//@property(nonatomic,strong)DCCircularSlider *cicrleProgress;
@end

@implementation CollectViewController

//- (id)init:(MainViewController *)mainVC {
//
//    if ([super init]) {
//        
//        self.mainVC = mainVC;
//    }
//    
//    return self;
//}

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    _cicrleProgress = [[DCCircularSlider alloc]initWithFrame:CGRectMake(0, 14, 44, 44)];
//    _cicrleProgress.enabled = NO;
//    _cicrleProgress.lineWidth = 2.0;
//    _cicrleProgress.filledColor = [UIColor redColor];// 填充色
//    _cicrleProgress.unfilledColor = [UIColor lightGrayColor];// 背景色
//    // 传入目标时间 与 可变时间  int
//    [_cicrleProgress drawValue:7.5 withMaxValue:15];
//    [_shopcarView addSubview:_cicrleProgress];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.text = @"我的收藏";
    titleLbl.font = [UIFont systemFontOfSize:20];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLbl;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"ic_action_arrow_left"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
}

- (void)reload:(NSNotification*) notification {

//    [self onLoad];
    
}

- (void)backClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initView {

    [self setTable];
    
}

- (void)onLoad {

    [DataBaseOperation createSql];
    self.arrJobModel = [[NSMutableArray alloc]init];
    NSString *sql = @"select *from tb_collect";
    FMResultSet *set = [DataBaseOperation getQuery:sql];
    BOOL flag = NO;
    while ([set next]) {
        flag = YES;
        BmobQuery *bquery = [BmobQuery queryWithClassName:@"Lottery"];
//      [bquery includeKey:@"publisherCompany"];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:table animated:YES];
        hud.labelText = @"Loading";
        [bquery getObjectInBackgroundWithId:[set stringForColumn:@"job_id"] block:^(BmobObject *object,NSError *error){
            [hud hide:YES];
            if (error){
                //进行错误处理
            }else{
                if (object) {
                    
                    JobModel *jobModel = [[JobModel alloc]init];
                    jobModel.objectId = [object objectForKey:@"objectId"];
                    jobModel.createdAt = [object objectForKey:@"createdAt"];
                    jobModel.title = [object objectForKey:@"title"];
                    jobModel.type = [object objectForKey:@"type"];
                    jobModel.result = [object objectForKey:@"result"];
                    jobModel.date = [object objectForKey:@"date"];
                    [self.arrJobModel addObject:jobModel];
                }
            }
            
            [table reloadData];
        }];
    }
    
    
    
    if (!flag) {
        
        alertView(@"提示", @"暂无收藏")
        [table reloadData];
        return;
    }
    
    
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

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
