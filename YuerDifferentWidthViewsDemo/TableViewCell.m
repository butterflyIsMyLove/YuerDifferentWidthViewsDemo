//
//  TableViewCell.m
//  YuerDifferentWidthViewsDemo
//
//  Created by XiangTaiMini on 2017/5/23.
//  Copyright © 2017年 yuer. All rights reserved.
//

#import "TableViewCell.h"
#import "NSString+Size.h"

@interface TableViewCell ()

@property (nonatomic , assign) CGFloat getCellHeight;

@end
@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setContents:(NSArray *)contents {
    _contents = contents;
    [self setupViews];
}

- (void)setupViews {
    
    CGFloat x = 10;
    CGFloat y = 10;
    CGFloat h = 25;
    CGFloat row = 1;
    CGFloat coloum = 0;
    
    for (int i = 0; i < self.contents.count; i++) {
        NSString *btnTitle = self.contents[i];
        CGFloat w = [btnTitle stringSizeWithFontFloat:14].width + 10;
        if (x > [UIScreen mainScreen].bounds.size.width || x + w > [UIScreen mainScreen].bounds.size.width) {
            row++;
            coloum = 1;
            x = 10;
        }
        
        y = h * (row - 1) + row * 10;
        UIButton *button = [self setupButtonWithBtnTitle:btnTitle x:x y:y];
        [self.contentView addSubview:button];
        x = x + w + 20;
    }
    self.getCellHeight = y + h + 10;
}

- (UIButton *)setupButtonWithBtnTitle:(NSString *)btnTitle x:(CGFloat)x y:(CGFloat)y {
    CGFloat w = [btnTitle stringSizeWithFontFloat:14].width + 10;
    CGFloat h = 25;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(x, y, w, h);
    [button setTitle:btnTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 1;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    return button;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
