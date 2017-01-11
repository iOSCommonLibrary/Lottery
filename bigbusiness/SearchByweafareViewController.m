//
//  SearchCompanyViewController.m
//  bigbusiness
//
//  Created by zzy on 12/11/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "SearchByweafareViewController.h"
#import "CustomButton.h"
#import "SearchCollectionViewCell.h"

@interface SearchByweafareViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{

    NSDictionary *titleDic;
    UICollectionView *collect;
    UIButton *searchBtn;
    NSMutableArray *dataArr;
}

@end

@implementation SearchByweafareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    titleDic = @{@"0":@[@"五险一金",@"周末双休",@"长白班"],@"1":@[@"包吃包住",@"奖励计划",@"公积金"]};
    self.view.backgroundColor = CustomColor(242, 237, 241);
    [self hiddenTabBar:self];
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.text = @"福利";
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
    
    [self setCollect];
    [self setSearchBtn];
}

- (void)onLoad {
    
    dataArr = [[NSMutableArray alloc]init];
}

- (void)setCollect {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((self.view.frame.size.width - 20)/4, 30);
    layout.minimumLineSpacing = 0; //上下间隔
    layout.minimumInteritemSpacing = 0; //左右间隔
    layout.sectionInset = UIEdgeInsetsMake(0, [UIAdapter transferWidth:20], 0, 0);//设置边距
    
    
    collect = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    collect.backgroundColor = [UIColor clearColor];
    collect.delegate = self;
    collect.dataSource = self;
    
    [self.view addSubview:collect];
    [collect registerClass:[SearchCollectionViewCell class] forCellWithReuseIdentifier:@"identify"];
    
    [collect mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset([UIAdapter transferHeight:40]);
        make.bottom.equalTo(self.view.mas_top).with.offset([UIAdapter transferHeight:200]);
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
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"searchByWare" object:dataArr];
    [self backClick];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    NSString *sec = [NSString stringWithFormat:@"%ld",(long)section];
    NSArray *arr = [titleDic objectForKey:sec];
    return arr.count;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return titleDic.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identify" forIndexPath:indexPath];
    
    NSString *sec = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
    
    
    [cell.checkBox setBackgroundImage:[UIImage imageNamed:@"login_checkbox_on"] forState:UIControlStateSelected];
    [cell.checkBox setBackgroundImage:[UIImage imageNamed:@"login_checkbox"] forState:UIControlStateNormal];

    cell.checkBox.indexPath = indexPath;
    cell.titleLbl.text = [titleDic objectForKey:sec][indexPath.row];
    [cell.checkBox addTarget:self action:@selector(checkBoxClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)checkBoxClick:(CustomButton *)sender {
    
    sender.selected = !sender.selected;

    SearchCollectionViewCell *cell = (SearchCollectionViewCell *)[collect cellForItemAtIndexPath:sender.indexPath];
    
    if (sender.selected) {
        
        [dataArr addObject:cell.titleLbl.text];
    }
}




////解决父试图的手势覆盖子试图点击事件的问题！！！
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    
//    if ([touch.view isKindOfClass:[UITextField class]]) {
//        return NO;
//    }
//    
//    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
//    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
//        
//        return NO;
//    }
//    
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
