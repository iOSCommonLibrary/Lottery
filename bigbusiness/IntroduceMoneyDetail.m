//
//  IntroduceMoneyDetail.m
//  bigbusiness
//
//  Created by zzy on 2/13/16.
//  Copyright © 2016 zzy. All rights reserved.
//

#import "IntroduceMoneyDetail.h"
#import "IntroduceMoneyTableViewCell.h"
#import "IntroduceMoneyModel.h"

@interface IntroduceMoneyDetail()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *table;
    NSMutableArray *leftArrTxt;
    NSMutableArray *rightArrTxt;
}

@end

@implementation IntroduceMoneyDetail

- (instancetype)initData: (IntroduceMoneyModel *)model {

    if ([super init]) {
        
        
        leftArrTxt = [[NSMutableArray alloc]initWithObjects:@"公司名字:",@"员工名字:",@"ID:",@"性别:",@"面试日期:",@"报到日期:",@"截止日期:",@"工作天数:",@"在职十天:",@"来源:",@"在职:",@"离职:",@"其他:", nil];
        
        rightArrTxt = [[NSMutableArray alloc]initWithObjects:model.companyName,model.emplpyeeName,model.emplpyeeID,model
                       .sexStr,model.interviewDate,model.registerDate,model.endDate,model.workDay,model.salary,model.source,model.isWorkingStr,@"",@"", nil];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = CustomColor(240, 238, 241);
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.text = @"详情";
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

    [self setTable];
}

- (void)setTable {

    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section; {
    
    return leftArrTxt.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    IntroduceMoneyTableViewCell *cell = [IntroduceMoneyTableViewCell cellWithTableView:tableView leftSpace:0];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.leftLbl.text = leftArrTxt[indexPath.row];
    cell.leftLbl.font = [UIFont systemFontOfSize:12];
    cell.leftLbl.textColor = [UIColor lightGrayColor];
    
    cell.rightLbl.text = rightArrTxt[indexPath.row];
    cell.rightLbl.font = [UIFont systemFontOfSize:12];
    cell.rightLbl.textColor = [UIColor purpleColor];


    return cell;
}

@end
