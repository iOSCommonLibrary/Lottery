//
//  ViewControllerBase.h
//  HeXin
//
//  Created by zzy on 9/22/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerBase : UIViewController

- (void)showTabBar:(UIViewController *)sender;
- (void)hiddenTabBar:(UIViewController *)sender;
- (void)showNavgation:(UIViewController *)sender;
- (void)hiddenNavgation:(UIViewController *)sender;
- (void)showProgress:(NSString *)msg;
- (void)hiddenProgress;

@end
