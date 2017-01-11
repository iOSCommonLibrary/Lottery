//
//  TransitionViewController.m
//  BlueWhale
//
//  Created by zzy on 5/10/16.
//  Copyright © 2016 zzy. All rights reserved.
//

#import "TransitionViewController.h"
#import "CSWebviewControllerViewController.h"
#import "MainViewController.h"
@interface TransitionViewController ()

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self animate];
}

- (void)animate {
    
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    CGSize size = window.bounds.size;
    NSString *viewOrientation = @"Portrait";  //横屏请设置成 @"Landscape"
    NSString *launchImage = nil;
    
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, size) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImage = dict[@"UILaunchImageName"];
        }
    }
    
    UIImageView *launchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:launchImage]];
    launchView.frame = self.view.bounds;
    launchView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:launchView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
