//
//  TableViewCell.h
//  YuerDifferentWidthViewsDemo
//
//  Created by XiangTaiMini on 2017/5/23.
//  Copyright © 2017年 yuer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, nullable, strong) NSArray *contents;

- (CGFloat)getCellHeight;

@end
