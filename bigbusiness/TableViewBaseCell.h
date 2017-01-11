//
//  TableViewBaseCell.h
//  HeXin
//
//  Created by zzy on 9/25/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewBaseCell : UITableViewCell
- (id)init:(UITableViewCellStyle)style reuseIdentifier :(NSString*)reuseIdentifier leftSpace :(CGFloat)leftSpace;
@end
