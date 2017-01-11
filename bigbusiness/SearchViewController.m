//
//  SearchViewController.m
//  bigbusiness
//
//  Created by zzy on 12/28/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCollectionViewCell.h"

@interface SearchViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    UICollectionView *collect;
    UIButton *searchBtn;
    NSDictionary *titleDic;
    NSString *jobName;
    NSMutableDictionary *isCheckDic;
    NSIndexPath *path; //用来记录上次点击的cell
}
@property (strong, nonatomic) IBOutlet UILabel *line;
@property (strong, nonatomic) IBOutlet UITextField *companyNameTxt;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    jobName = @"";
    path = nil;
    titleDic = @{@"0":@[@"普工",@"文员",@"翻译",@"销售"],@"1":@[@"保安",@"司机",@"快递员",@"服务员"],@"2":@[@"收银员",@"美容",@"美发"]};
    self.view.backgroundColor = CustomColor(238, 238, 238);
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.text = @"搜索";
    titleLbl.font = [UIFont systemFontOfSize:20];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLbl;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"ic_action_arrow_left"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
}

- (void)backClick {
    
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTable" object:nil];
}

- (void)initView {

    [self setCollect];
    [self setSearchBtn];
}

- (void)onLoad {


}

- (void)setCollect {

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((self.view.frame.size.width - 20)/4, 30);
    layout.minimumLineSpacing = 0; //上下间隔
    layout.minimumInteritemSpacing = 0; //左右间隔
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//设置边距

    
    collect = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    collect.backgroundColor = [UIColor clearColor];
    collect.delegate = self;
    collect.dataSource = self;
    
    [self.view addSubview:collect];
    [collect registerClass:[SearchCollectionViewCell class] forCellWithReuseIdentifier:@"identify"];

    [collect mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.line.mas_bottom).with.offset([UIAdapter transferHeight:20]);
        make.bottom.equalTo(self.line.mas_bottom).with.offset([UIAdapter transferHeight:100]);
        make.left.equalTo(self.view.mas_left).with.offset([UIAdapter transferWidth:10]);
        make.right.equalTo(self.view.mas_right).with.offset(-[UIAdapter transferWidth:10]);
        
    }];
}

- (void)setSearchBtn {

    searchBtn = [[UIButton alloc]init];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.backgroundColor = CustomColor(0, 183, 241);
    [self.view addSubview:searchBtn];
    searchBtn.layer.cornerRadius = 8;
    searchBtn.layer.masksToBounds = YES;
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(collect.mas_bottom).with.offset([UIAdapter transferHeight:20]);
        make.bottom.equalTo(collect.mas_bottom).with.offset([UIAdapter transferHeight:60]);
        make.left.equalTo(self.view.mas_left).with.offset([UIAdapter transferWidth:10]);
        make.right.equalTo(self.view.mas_right).with.offset(-[UIAdapter transferWidth:10]);
        
    }];
}

- (void)search {

    NSDictionary *dic = @{@"companyName":self.companyNameTxt.text,@"jobType":jobName};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"searchByName" object:dic];
    [self backClick];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    NSString *sec = [NSString stringWithFormat:@"%ld",(long)section];
    NSMutableArray *arr = [titleDic objectForKey:sec];
    return arr.count;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return titleDic.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identify" forIndexPath:indexPath];
    
    NSString *sec = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
    NSMutableArray *arr = [titleDic objectForKey:sec];

    
    [cell.checkBox setBackgroundImage:[UIImage imageNamed:@"login_checkbox_on"] forState:UIControlStateSelected];
    [cell.checkBox setBackgroundImage:[UIImage imageNamed:@"login_checkbox"] forState:UIControlStateNormal];
    
    cell.checkBox.indexPath = indexPath;
    cell.titleLbl.text = arr[indexPath.row];
    
    [cell.checkBox addTarget:self action:@selector(checkBoxClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)checkBoxClick:(CustomButton *)sender {
    
    sender.selected = !sender.selected;
    
    SearchCollectionViewCell *cell = (SearchCollectionViewCell *)[collect cellForItemAtIndexPath:sender.indexPath];
    
    //如果不是第一次点击
    if (path != nil) {
        
        //如果不是点击的同一个cell
        if (path != sender.indexPath) {
            
            SearchCollectionViewCell *cell = (SearchCollectionViewCell *)[collect cellForItemAtIndexPath:path];
            cell.checkBox.selected = NO;
        }
    }
    
    if (sender.selected) {
        
        jobName = cell.titleLbl.text;
    }
    
    else {
        
        jobName = @"";
    }
    
    path = sender.indexPath; //记录当前点击的cell
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.companyNameTxt resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
