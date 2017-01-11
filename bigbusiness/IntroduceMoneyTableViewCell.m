

//
//  IntroduceMoneyTableViewCell.m
//  bigbusiness
//
//  Created by zzy on 2/13/16.
//  Copyright © 2016 zzy. All rights reserved.
//

#import "IntroduceMoneyTableViewCell.h"
#import "IntroduceMoneyModel.h"

@implementation IntroduceMoneyTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView leftSpace:(CGFloat)leftSpace{

    static NSString *ID = @"identify";
    IntroduceMoneyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[IntroduceMoneyTableViewCell alloc] init:UITableViewCellStyleSubtitle reuseIdentifier:ID leftSpace:leftSpace];
    }
    return cell;
}

- (id)init:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier leftSpace:(CGFloat)leftSpace {

    if ([super init:style reuseIdentifier:reuseIdentifier leftSpace:leftSpace]) {
    
        self.leftLbl = [[UILabel alloc]init];
        [self addSubview:self.leftLbl];
        [self.leftLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_left).with.offset([UIAdapter transferWidth:7]);
            make.width.equalTo(@100);
            make.centerY.equalTo(self.mas_centerY);
            make.height.equalTo(@40);
            
        }];
        
        
        self.rightLbl = [[UILabel alloc]init];
        [self.rightLbl setTextColor:[UIColor purpleColor]];
        [self addSubview:self.rightLbl];
        [self.rightLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.leftLbl.mas_right).with.offset([UIAdapter transferWidth:20]);
            make.centerY.equalTo(self.mas_centerY);
            make.height.equalTo(@40);
        }];
    }
    
    return self;
}

@end
