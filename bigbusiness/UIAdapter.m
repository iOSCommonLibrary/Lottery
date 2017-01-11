//
//  UIAdapter.m
//  HeXin
//
//  Created by zzy on 9/21/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "UIAdapter.h"

static CGFloat width = 0;
static CGFloat height = 0;
static CGFloat widthRatio = 0;
static CGFloat heightRatio = 0;

@implementation UIAdapter

+(CGFloat)transferWidth:(CGFloat) num {

    return num * widthRatio;
    
}

+(CGFloat)transferHeight:(CGFloat) num {

    return num * heightRatio;
}

+(UIFont *)transferFont:(CGFloat)num {

    return [UIFont systemFontOfSize:num*heightRatio];
}

+(void)config:(CGRect)window {

    width = window.size.width;
    height = window.size.height;
    widthRatio = window.size.width /320;
    heightRatio =  window.size.height / 480;
}

@end
