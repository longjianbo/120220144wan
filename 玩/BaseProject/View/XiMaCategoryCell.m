//
//  XiMaCategoryCell.m
//  BaseProject
//
//  Created by tarena on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaCategoryCell.h"

@implementation XiMaCategoryCell
- (UILabel *)orderLb {
    if(_orderLb == nil) {
        _orderLb = [[UILabel alloc] init];
        _orderLb.font = [UIFont boldSystemFontOfSize:18];
        _orderLb.textAlignment = NSTextAlignmentCenter;
        _orderLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_orderLb];
//使用KVO-键值观察 如果text被赋值为1 颜色是...
//下方方法：如果_orderLb的text属性 被赋 新值 则触发task
    [_orderLb bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
        NSString *value = change[@"new"];
        if ([value isEqualToString:@"1"]) {
            _orderLb.textColor = [UIColor redColor];
        }else if([value isEqualToString:@"2"]){
            _orderLb.textColor = [UIColor blueColor];
        }else if([value isEqualToString:@"3"]){
            _orderLb.textColor = [UIColor greenColor];
        }else{
            _orderLb.textColor = [UIColor blackColor];
        }
    }];
        
        
    }
    return _orderLb;
}

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont boldSystemFontOfSize:19];
        _titleLb.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLb];
    }
    return _titleLb;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.font = [UIFont systemFontOfSize:15];
        _descLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLb];
    }
    return _descLb;
}

- (UILabel *)numberLb {
    if(_numberLb == nil) {
        _numberLb = [[UILabel alloc] init];
        _numberLb.font = [UIFont systemFontOfSize:12];
        _numberLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_numberLb];
    }
    return _numberLb;
}

- (TRImageView *)numberIcon {
    if(_numberIcon == nil) {
        _numberIcon = [[TRImageView alloc] init];
        _numberIcon.imageView.image = [UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIcon];
    }
    return _numberIcon;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//右箭头样式
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//添加依赖autolayout 一定要有顺序 即从左到右 从上到下
        [self.orderLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(35);
        }];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.left.mas_equalTo(self.orderLb.mas_right).mas_equalTo(0);
        }];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        [self.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.iconIV.mas_centerY).mas_equalTo(0);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        [self.numberIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
            
        }];
        [self.numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIcon.mas_right).mas_equalTo(2);
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIcon);
        }];
//分割线左间距调整
        self.separatorInset = UIEdgeInsetsMake(0, 70, 0, 0);
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
