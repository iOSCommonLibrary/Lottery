//
//  HomeTableViewCell.h
//  bigbusiness
//
//  Created by zzy on 11/14/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "TableViewBaseCell.h"

@interface HomeTableViewCell : TableViewBaseCell

@property(nonatomic,strong)UIView *icon;
@property(nonatomic,strong)UILabel *iconLbl;
@property(nonatomic,strong)UILabel *bigLbl;
@property(nonatomic,strong)UILabel *dateLbl;
@property(nonatomic,strong)UILabel *smallLbl1;
@property(nonatomic,strong)UILabel *smallLbl2;
@property(nonatomic,strong)UILabel *smallLbl3;
@property(nonatomic,strong)UILabel *smallLbl4;
@property(nonatomic,strong)UILabel *smallLbl5;
@property(nonatomic,strong)UILabel *smallLbl6;
@property(nonatomic,strong)UILabel *smallLbl7;

- (id)init:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier leftSpace:(CGFloat)leftSpace;
@end
