//
//  IntroduceMoneyTableViewCell.h
//  bigbusiness
//
//  Created by zzy on 2/13/16.
//  Copyright © 2016 zzy. All rights reserved.
//

#import "TableViewBaseCell.h"
@class IntroduceMoneyModel;
@interface IntroduceMoneyTableViewCell : TableViewBaseCell


@property(nonatomic,strong)UILabel *leftLbl;
@property(nonatomic,strong)UILabel *rightLbl;

+ (instancetype)cellWithTableView:(UITableView *)tableView leftSpace:(CGFloat)leftSpace;
@end
