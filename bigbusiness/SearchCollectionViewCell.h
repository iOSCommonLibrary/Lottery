//
//  SearchCollectionViewCell.h
//  bigbusiness
//
//  Created by zzy on 12/29/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomButton.h"
@interface SearchCollectionViewCell : UICollectionViewCell
- (id)initWithFrame:(CGRect)frame;
@property(nonatomic ,strong)CustomButton *checkBox;
@property(nonatomic ,strong)UILabel *titleLbl;
@end
