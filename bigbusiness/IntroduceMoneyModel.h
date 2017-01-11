//
//  IntroduceMoneyModel.h
//  bigbusiness
//
//  Created by zzy on 2/13/16.
//  Copyright © 2016 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntroduceMoneyModel : NSObject
@property(nonatomic,copy)NSString *objectId;
@property(nonatomic,copy)NSString *companyName;
@property(nonatomic,copy)NSString *emplpyeeName;
@property(nonatomic,copy)NSString *emplpyeeID;
@property(nonatomic,assign)BOOL boolSex;
@property(nonatomic,readonly)NSString *sexStr;
@property(nonatomic,copy)NSString *interviewDate;
@property(nonatomic,copy)NSString *registerDate;
@property(nonatomic,copy)NSString *endDate;
@property(nonatomic,copy)NSString *workDay;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,assign)BOOL isWorking;
@property(nonatomic,readonly)NSString *isWorkingStr;
@property(nonatomic,copy)NSString *lz;
@property(nonatomic,copy)NSString *other;
@property(nonatomic,copy)NSString *salary;
@end
