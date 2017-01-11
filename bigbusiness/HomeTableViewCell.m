//
//  HomeTableViewCell.m
//  bigbusiness
//
//  Created by zzy on 11/14/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "HomeTableViewCell.h"


@implementation HomeTableViewCell

- (id)init:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier leftSpace:(CGFloat)leftSpace {

    if ([super init:style reuseIdentifier:reuseIdentifier leftSpace:leftSpace]) {
        
        self.icon = [[UIView alloc]init];
        self.icon.layer.cornerRadius = 22;
        self.icon.layer.masksToBounds = YES;
        
        [self.icon setBackgroundColor:CustomColor(94, 182, 165)];
        [self addSubview:self.icon];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.mas_centerY);
            make.height.equalTo(@45);
            make.left.equalTo(self.mas_left).with.offset([UIAdapter transferWidth:5]);
            make.width.equalTo(@45);
            
        }];
        
        self.bigLbl = [[UILabel alloc]init];
        [self addSubview:self.bigLbl];
        [self.bigLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.icon.mas_top).with.offset(2);
            make.bottom.equalTo(self.icon.mas_top).with.offset([UIAdapter transferHeight:13]);
            make.left.equalTo(self.icon.mas_right).with.offset([UIAdapter transferWidth:15]);            
        }];
        
        self.dateLbl = [[UILabel alloc]init];
        self.dateLbl.font = [UIFont systemFontOfSize:12];
        self.dateLbl.textColor = [UIColor lightGrayColor];
        [self addSubview:self.dateLbl];
        [self.dateLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.icon.mas_top).with.offset([UIAdapter transferHeight:5]);
            make.bottom.equalTo(self.icon.mas_top).with.offset([UIAdapter transferHeight:13]);
//            make.left.equalTo(self.bigLbl.mas_right).with.offset([UIAdapter transferWidth:5]);
            make.right.equalTo(self.mas_right).with.offset([UIAdapter transferWidth:-10]);
            
        }];
        
        self.iconLbl = [[UILabel alloc]init];
        [self addSubview:self.iconLbl];
        [self.iconLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.icon.mas_centerY);
            make.height.equalTo(@40);
            make.centerX.equalTo(self.icon.mas_centerX);
            make.width.equalTo(@40);
            
        }];
    
        self.smallLbl1 = [[UILabel alloc]init];
        self.smallLbl1.backgroundColor = [UIColor redColor];
        self.smallLbl1.layer.cornerRadius = 13;
        self.smallLbl1.layer.masksToBounds = YES;
        self.smallLbl1.textAlignment = NSTextAlignmentCenter;
        self.smallLbl1.textColor = [UIColor whiteColor];
        [self addSubview:self.smallLbl1];
        [self.smallLbl1 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.bigLbl.mas_bottom).with.offset([UIAdapter transferHeight:5]);
            make.height.equalTo(@26);
            make.left.equalTo(self.icon.mas_right).with.offset([UIAdapter transferWidth:5]);
            make.width.equalTo(@26);
            
        }];
        
        self.smallLbl2 = [[UILabel alloc]init];
        self.smallLbl2.backgroundColor = [UIColor redColor];
        self.smallLbl2.layer.cornerRadius = 13;
        self.smallLbl2.layer.masksToBounds = YES;
        self.smallLbl2.textAlignment = NSTextAlignmentCenter;
        self.smallLbl2.textColor = [UIColor whiteColor];
        [self addSubview:self.smallLbl2];
        [self.smallLbl2 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.bigLbl.mas_bottom).with.offset([UIAdapter transferHeight:5]);
            make.height.equalTo(@26);
            make.left.equalTo(self.smallLbl1.mas_right).with.offset([UIAdapter transferWidth:3]);
            make.width.equalTo(@26);
            
        }];
        
        self.smallLbl3 = [[UILabel alloc]init];
        self.smallLbl3.backgroundColor = [UIColor redColor];
        self.smallLbl3.layer.cornerRadius = 13;
        self.smallLbl3.layer.masksToBounds = YES;
        self.smallLbl3.textAlignment = NSTextAlignmentCenter;
        self.smallLbl3.textColor = [UIColor whiteColor];
        [self addSubview:self.smallLbl3];
        [self.smallLbl3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.bigLbl.mas_bottom).with.offset([UIAdapter transferHeight:5]);
            make.height.equalTo(@26);
            make.left.equalTo(self.smallLbl2.mas_right).with.offset([UIAdapter transferWidth:3]);
            make.width.equalTo(@26);
            
        }];
        
        self.smallLbl4 = [[UILabel alloc]init];
        self.smallLbl4.backgroundColor = [UIColor redColor];
        self.smallLbl4.layer.cornerRadius = 13;
        self.smallLbl4.layer.masksToBounds = YES;
        self.smallLbl4.textAlignment = NSTextAlignmentCenter;
        self.smallLbl4.textColor = [UIColor whiteColor];
        [self addSubview:self.smallLbl4];
        [self.smallLbl4 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.bigLbl.mas_bottom).with.offset([UIAdapter transferHeight:5]);
            make.height.equalTo(@26);
            make.left.equalTo(self.smallLbl3.mas_right).with.offset([UIAdapter transferWidth:3]);
            make.width.equalTo(@26);
            
        }];
        
        self.smallLbl5 = [[UILabel alloc]init];
        self.smallLbl5.backgroundColor = [UIColor redColor];
        self.smallLbl5.layer.cornerRadius = 13;
        self.smallLbl5.layer.masksToBounds = YES;
        self.smallLbl5.textAlignment = NSTextAlignmentCenter;
        self.smallLbl5.textColor = [UIColor whiteColor];
        [self addSubview:self.smallLbl5];
        [self.smallLbl5 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.bigLbl.mas_bottom).with.offset([UIAdapter transferHeight:5]);
            make.height.equalTo(@26);
            make.left.equalTo(self.smallLbl4.mas_right).with.offset([UIAdapter transferWidth:3]);
            make.width.equalTo(@26);
            
        }];
        
        self.smallLbl6 = [[UILabel alloc]init];
        self.smallLbl6.backgroundColor = [UIColor redColor];
        self.smallLbl6.layer.cornerRadius = 13;
        self.smallLbl6.layer.masksToBounds = YES;
        self.smallLbl6.textAlignment = NSTextAlignmentCenter;
        self.smallLbl6.textColor = [UIColor whiteColor];
        [self addSubview:self.smallLbl6];
        [self.smallLbl6 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.bigLbl.mas_bottom).with.offset([UIAdapter transferHeight:5]);
            make.height.equalTo(@26);
            make.left.equalTo(self.smallLbl5.mas_right).with.offset([UIAdapter transferWidth:3]);
            make.width.equalTo(@26);
            
        }];
        
        self.smallLbl7 = [[UILabel alloc]init];
        self.smallLbl7.backgroundColor = [UIColor blueColor];
        self.smallLbl7.layer.cornerRadius = 13;
        self.smallLbl7.layer.masksToBounds = YES;
        self.smallLbl7.textAlignment = NSTextAlignmentCenter;
        self.smallLbl7.textColor = [UIColor whiteColor];
        [self addSubview:self.smallLbl7];
        [self.smallLbl7 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.bigLbl.mas_bottom).with.offset([UIAdapter transferHeight:5]);
            make.height.equalTo(@26);
            make.left.equalTo(self.smallLbl6.mas_right).with.offset([UIAdapter transferWidth:3]);
            make.width.equalTo(@26);
            
        }];

    }
    
    return self;
}

@end
