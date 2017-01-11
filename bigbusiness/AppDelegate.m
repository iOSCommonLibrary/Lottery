//
//  AppDelegate.m
//  bigbusiness
//
//  Created by zzy on 11/12/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "AppDelegate+Notification.h"
#import "JPUSHService.h"
#import "CSWebviewControllerViewController.h"
#import "TransitionViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UIAdapter config:[UIScreen mainScreen].bounds];
    [Bmob registerWithAppKey:@"8f0ee9079dcc6cf80fb921fd8199cfeb"];
    [self registerJPush:launchOptions];
    [[UINavigationBar appearance] setBarTintColor:CustomColor(113, 3, 7)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    TransitionViewController *vc = [[TransitionViewController alloc]init];
    self.window.rootViewController = vc;
    [self loadData];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)loadData {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    manager.requestSerializer.timeoutInterval = 15.0f;
    NSDictionary *params = @{@"appid": @"c77app3"};
    __weak typeof (self)wSelf = self;
    [manager GET:@"http://appmgr.jwoquxoc.com/frontApi/getAppSettingsInfo.html" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dict = responseObject;
        if ([dict[@"status"] integerValue] == 1) {//成功
            
            if ([dict[@"isshowwap"] isEqualToString:@"1"]) {//切换到wap页面
                
                NSString *wapUrl = dict[@"wapurl"];
                [wSelf initRootVC:wapUrl];
                
            }else {//不切换到wap页面
                
                [wSelf initRootVC:nil];
            }
            
        }else {
            
            [wSelf initRootVC:nil];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error.description);
        [wSelf initRootVC:nil];
    }];
}

- (void)initRootVC:(NSString *)wapUrl {
    
    if (wapUrl.length > 0) {
        
        CSWebviewControllerViewController *webVC = [[CSWebviewControllerViewController alloc]init];
        webVC.url = wapUrl;
        //        UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:webVC];
        self.window.rootViewController = webVC;
        
    }else {
        
        MainViewController *mainView = [[MainViewController alloc]init];
        UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:mainView];
        self.window.rootViewController = mainNav;
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
