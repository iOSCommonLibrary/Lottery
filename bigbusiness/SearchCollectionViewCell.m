//
//  SearchCollectionViewCell.m
//  bigbusiness
//
//  Created by zzy on 12/29/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "SearchCollectionViewCell.h"

@implementation SearchCollectionViewCell

- (id)initWithFrame:(CGRect)frame {

    if ([super initWithFrame:frame]) {
        
        self.checkBox = [[CustomButton alloc]init];
        
        [self addSubview:self.checkBox];
        [self.checkBox mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.mas_top).with.offset(5);
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(self.mas_left);
            make.width.equalTo(@20);
            
        }];
        
        self.titleLbl = [[UILabel alloc]init];
        self.titleLbl.font = [UIFont systemFontOfSize:11];
        [self addSubview:self.titleLbl];
        [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.mas_top).with.offset([UIAdapter transferHeight:5]);
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(self.checkBox.mas_right).with.offset([UIAdapter transferWidth:5]);
            make.right.equalTo(self.mas_right);
        }];
    }
    
    return self;
}
@end
