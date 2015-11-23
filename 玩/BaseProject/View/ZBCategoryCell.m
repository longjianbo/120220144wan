//
//  ZBCategoryCell.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryCell.h"

@implementation ZBCategoryCell

- (UILabel *)zbText {
    if(_zbText == nil) {
        _zbText = [[UILabel alloc] init];
        [self.contentView addSubview:_zbText];
        _zbText.font = [UIFont systemFontOfSize:16];
        [_zbText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _zbText;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(254, 249, 246);
        self.selectedBackgroundView = view;
    }
    return self;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
