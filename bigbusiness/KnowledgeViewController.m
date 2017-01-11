//
//  KnowledgeViewController.m
//  bigbusiness
//
//  Created by zzy on 1/3/17.
//  Copyright © 2017 zzy. All rights reserved.
//

#import "KnowledgeViewController.h"
#import "KnowledgeDetailViewController.h"
@interface KnowledgeViewController ()<UITableViewDelegate,UITableViewDataSource>
/** <##> */
@property(nonatomic,strong)NSArray *dataArr;
@end

@implementation KnowledgeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"彩票百科";
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArr = @[@"时时彩",@"六合彩"];
    UITableView *table = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identify"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identify"];
        
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    KnowledgeDetailViewController *vc = [[KnowledgeDetailViewController alloc]init];
    if (indexPath.row == 0) {
        
        vc.content = @"时时彩是一种在线即开型彩票玩法，属于基诺型彩票，由福利彩票发行管理中心负责承销。时时彩投注区分为万位、千位、百位、十位和个位，各位号码范围为0～9。每期从各位上开出1个号码作为中奖号码，即开奖号码为5位数。时时彩玩法即是竞猜5位开奖号码的全部号码、部分号码或部分号码特征。时时彩分星彩玩法和大小单双玩法。星彩玩法包括五星、三星、二星和一星。";
    }
    
    if (indexPath.row == 1) {
        
        vc.content = @"为加强打击民间的字花赌博，并防止赌博资金流向黑社会等非法集团，香港政府从1975年起开售乐透式彩票，取代原先的马票。负责开彩的是法定机构香港奖券管理局，由香港赛马会以“香港马会奖券有限公司”的名义代理接受投注。投注彩池除用作派彩外，余额拨交社会福利署奖券基金用作慈善用途。最初的彩票是14选6，每周搅珠开彩。为迎合大众“以小博大”的心理，1976年大幅增加中彩难度及派彩，改变开彩方法为36选6（及一个特别号码)，正式名为“六合彩”，并将开彩次数增加为每星期2次（最近更增加至每星期3次）。之后为维持派彩数额及增加中奖难度，曾多次增加选择数目。正如其他赌博模式一样，六合彩的中彩回报必定远低于其成本。";
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
