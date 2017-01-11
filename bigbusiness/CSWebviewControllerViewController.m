
//
//  CSWebviewControllerViewController.m
//  bigbusiness
//
//  Created by zzy on 11/28/16.
//  Copyright © 2016 zzy. All rights reserved.
//

#import "CSWebviewControllerViewController.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"
@interface CSWebviewControllerViewController ()<UIWebViewDelegate>
{
    
    NJKWebViewProgressView *_progressView;
    NJKWebViewProgress *_progressProxy;
    MBProgressHUD *_hud;
}
@property(nonatomic, strong)UIWebView *web;
@end

@implementation CSWebviewControllerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"nav_arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
}


- (void)backClick {
    
    [self.web goBack];
}

- (void)setUrl:(NSString *)url {

    self.web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    self.web.scalesPageToFit = YES;
    [self.view addSubview: self.web];
//    _progressProxy = [[NJKWebViewProgress alloc] init];
    self.web.delegate = self;
//    _progressProxy.webViewProxyDelegate = self;
//    _progressProxy.progressDelegate = self;
    
    CGFloat progressBarHeight = 2.f;
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, 64, navigationBarBounds.size.width, progressBarHeight);
//    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
//    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
//    [self.view addSubview:_progressView];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
//    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    _hud.label.text = @"Loading";
    [self.web loadRequest:request];
}

//-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
//{
//    [_progressView setProgress:progress animated:YES];
//    //    self.title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
//}

- (void)webViewDidFinishLoad:(UIWebView *)webView {

//    [_hud hideAnimated:YES];
}

@end
