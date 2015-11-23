//
//  BestGroupCell.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupCell.h"
#define kIconW (kWindowW-60*5)/6
@implementation BestGroupCell


- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:14];
        _titleLb.numberOfLines = 1;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(-70);
        }];
    }
    return _titleLb;
}

- (TRImageView *)icon1 {
    if(_icon1 == nil) {
        _icon1 = [[TRImageView alloc] init];
        [self.contentView addSubview:_icon1];
        [_icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kIconW);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
    }
    return _icon1;
}

- (TRImageView *)icon2 {
    if(_icon2 == nil) {
        _icon2 = [[TRImageView alloc] init];
        [self.contentView addSubview:_icon2];
        [_icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.icon1);
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.mas_equalTo(self.icon1.mas_right).mas_equalTo(kIconW);
        }];
    }
    return _icon2;
}

- (TRImageView *)icon3 {
    if(_icon3 == nil) {
        _icon3 = [[TRImageView alloc] init];
        [self.contentView addSubview:_icon3];
        [_icon3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.icon2);
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.mas_equalTo(self.icon2.mas_right).mas_equalTo(kIconW);
        }];
    }
    return _icon3;
}

- (TRImageView *)icon4 {
    if(_icon4 == nil) {
        _icon4 = [[TRImageView alloc] init];
        [self.contentView addSubview:_icon4];
        [_icon4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.icon3);
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.mas_equalTo(self.icon3.mas_right).mas_equalTo(kIconW);
        }];
    }
    return _icon4;
}

- (TRImageView *)icon5 {
    if(_icon5 == nil) {
        _icon5 = [[TRImageView alloc] init];
        [self.contentView addSubview:_icon5];
        [_icon5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.icon4);
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.mas_equalTo(self.icon4.mas_right).mas_equalTo(kIconW);
        }];
    }
    return _icon5;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.font = [UIFont systemFontOfSize:13];
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.numberOfLines = 2;
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin).mas_equalTo(0);
            make.top.mas_equalTo(self.icon1.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-8);
        }];
    }
    return _descLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(254, 249, 236);
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
