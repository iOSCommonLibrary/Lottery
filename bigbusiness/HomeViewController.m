//
//  HomeViewController.m
//  bigbusiness
//
//  Created by zzy on 11/12/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableSource.h"
#import <CoreLocation/CoreLocation.h>
#import "JobModel.h"

@interface HomeViewController ()<UIScrollViewDelegate,CLLocationManagerDelegate>
{
    UIScrollView *scroll;
    UIPageControl *pageControl;
    UIImageView *scrollImg;
    UITableView *table;
    NSArray *arry; //轮播图片数组
    UIButton *btn3;
    UIButton *btn1;
    NSString *cityName;
    NSDictionary *dataDic;
    NSMutableArray *dataArr;
}

@property(nonatomic,strong)HomeTableSource *tableSource;
@property(nonatomic,strong)MainViewController *mainVC;
@property(nonatomic,strong)CLLocationManager *manager;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation HomeViewController

- (id)init:(MainViewController *)mainVC {

    if ([super init]) {
        
        self.mainVC = mainVC;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableReloadByName:) name:@"searchByName" object:dataDic];

    self.view.backgroundColor = [UIColor clearColor];
    
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
//    [self showTabBar:self];
}

- (void)initView {

    [self setScrollView];
    [self setTable];
    [self setPageControl];
}

- (void)onLoad {

    self.tableSource = [[HomeTableSource alloc]init:table mainVC:self.mainVC];
    table.dataSource = self.tableSource;
    table.delegate = self.tableSource;
}

//轮播图片
- (void)setScrollView {

    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, [UIAdapter transferHeight:100])];
    [self.view addSubview:scroll];
    scroll.contentSize = CGSizeMake(2*self.view.frame.size.width, 0);
    [scroll setContentOffset:CGPointMake(0, 0) animated:true];
    scroll.bounces = NO;
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.delegate = self;
    [self addTimer];
    arry = [[NSArray alloc]initWithObjects:@"banner1",@"banner2",nil];
    for (int i = 0; i < arry.count; i++) {
        
        scrollImg = [[UIImageView alloc]initWithFrame:CGRectMake((scroll.frame.size.width)*i, 0, scroll.frame.size.width, scroll.frame.size.height)];
        [scroll addSubview:scrollImg];
        scrollImg.image = [UIImage imageNamed:arry[i]];
    } 
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;

}


// 开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
     //    关闭定时器(注意点; 定时器一旦被关闭,无法再开启)
     //    [self.timer invalidate];
      [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
     //    开启定时器
      [self addTimer];
}


- (void)addTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}

- (void)nextImage {
    
    int page = (int)pageControl.currentPage;
    if (page == arry.count - 1) {
        
        page = 0;
//        CGFloat x = page * scroll.frame.size.width;
//        scroll.contentOffset = CGPointMake(x, 0);
//        pageControl.currentPage = scroll.contentOffset.x/scroll.frame.size.width;
//        return;
    }
    
    else {
        
        page++;
    }
    
    //  滚动scrollview
    CGFloat x = page * scroll.frame.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        
        scroll.contentOffset = CGPointMake(x, 0);
    } completion:^(BOOL finished) {
        
        pageControl.currentPage = scroll.contentOffset.x/scroll.frame.size.width;
        
    }];
    
    
}

- (void)removeTimer {
    
    [self.timer invalidate];
}


- (void)setTable {

    table = [[UITableView alloc]initWithFrame:CGRectMake(0, scroll.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - scroll.frame.size.height - 48) style:UITableViewStylePlain];
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:table];
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(scroll.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];

}

- (void)setPageControl {

    pageControl = [[UIPageControl alloc]init];
    [self.view addSubview:pageControl];
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(scroll.mas_bottom).with.offset([UIAdapter transferHeight:-12]);
        make.bottom.equalTo(scroll.mas_bottom).with.offset([UIAdapter transferHeight:-2]);
        make.centerX.equalTo(scroll.mas_centerX);
        make.width.equalTo(scroll.mas_width);
    }];
    
    pageControl.numberOfPages = arry.count;
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:0.263 green:0.365 blue:0.447 alpha:1.0];
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.userInteractionEnabled = false;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
