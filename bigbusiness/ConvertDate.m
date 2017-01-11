//
//  ConvertDate.m
//  HeXin
//
//  Created by zzy on 11/27/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "ConvertDate.h"

@implementation ConvertDate

+ (NSDate *)dateFromString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date= [dateFormatter dateFromString:dateString];
    
    return date;
    
}
@end
