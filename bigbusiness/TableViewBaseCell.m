//
//  TableViewBaseCell.m
//  HeXin
//
//  Created by zzy on 9/25/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "TableViewBaseCell.h"

@interface TableViewBaseCell ()
{

    UILabel *bottomLine;
    
}
@end

@implementation TableViewBaseCell

- (id)init:(UITableViewCellStyle)style reuseIdentifier :(NSString*)reuseIdentifier leftSpace :(CGFloat)leftSpace{

    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        bottomLine = [[UILabel alloc]init];
        bottomLine.layer.borderColor = [UIColor colorWithRed:0.882 green:0.882 blue:0.882 alpha:1].CGColor;
        bottomLine.layer.borderWidth = 0.6;
        [self addSubview:bottomLine];
        [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.mas_bottom).with.offset(-0.6);
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset([UIAdapter transferWidth:leftSpace]);
            make.right.equalTo(self.mas_right);
        }];
    }
    
    return self;
}

@end


