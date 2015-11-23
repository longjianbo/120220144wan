//
//  BestGroupDetailCell.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupDetailCell.h"

@implementation BestGroupDetailCell

- (TRImageView *)imageLb {
    if(_imageLb == nil) {
        _imageLb = [[TRImageView alloc] init];
        [self.contentView addSubview:_imageLb];
        [_imageLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
    }
    return _imageLb;
}

- (UILabel *)desLb {
    if(_desLb == nil) {
        _desLb = [[UILabel alloc] init];
        _desLb.numberOfLines = 0;
        [self.contentView addSubview:_desLb];
        [_desLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.imageLb.mas_topMargin);
            make.left.mas_equalTo(self.imageLb.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-20);
            make.bottom.mas_equalTo(-10);
            
        }];
    }
    return _desLb;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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
