//
//  UIAdapter.h
//  HeXin
//
//  Created by zzy on 9/21/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAdapter : NSObject



+(CGFloat)transferWidth:(CGFloat) num;
+(CGFloat)transferHeight:(CGFloat) num;
+(UIFont *)transferFont:(CGFloat)num;
+(void)config:(CGRect)window;
@end
