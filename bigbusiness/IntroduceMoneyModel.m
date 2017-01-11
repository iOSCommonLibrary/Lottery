//
//  IntroduceMoneyModel.m
//  bigbusiness
//
//  Created by zzy on 2/13/16.
//  Copyright © 2016 zzy. All rights reserved.
//

#import "IntroduceMoneyModel.h"

@implementation IntroduceMoneyModel

- (NSString *)sexStr {

    if (self.boolSex) {
        
        return @"男";
    }else {
    
        return @"女";
    }
}

- (NSString *)isWorkingStr {
    
    if (self.isWorking) {
        
        return @"在职";
    }else {
        
        return @"不在职";
    }
}

@end
