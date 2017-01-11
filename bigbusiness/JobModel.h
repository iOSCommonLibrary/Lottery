//
//  JobModel.h
//  bigbusiness
//
//  Created by zzy on 11/15/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JobModel : BmobObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *result;
@property(nonatomic,copy)NSString *date;

@end
