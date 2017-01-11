//
//  AppDelegate+Notification.h
//  bigbusiness
//
//  Created by zzy on 12/30/16.
//  Copyright © 2016 zzy. All rights reserved.
//

#import "AppDelegate.h"
#import "JPUSHService.h"
@interface AppDelegate (Notification)<JPUSHRegisterDelegate>
- (void)registerJPush:(NSDictionary *)launchOptions;
@end
