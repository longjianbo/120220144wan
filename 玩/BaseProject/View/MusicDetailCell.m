//
//  MusicDetailCell.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicDetailCell.h"

@implementation MusicDetailCell
- (TRImageView *)coverIV {
    if(_coverIV == nil) {
        _coverIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(55, 55));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        _coverIV.layer.cornerRadius = 55/2;
//添加播放标识
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_coverIV addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.center.mas_equalTo(0);
        }];
    }
    return _coverIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.coverIV.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(self.timeLb.mas_left ).mas_equalTo(-10);
        }];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLb];
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.textColor = [UIColor lightGrayColor];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(50);
        }];
        _timeLb.textAlignment = NSTextAlignmentRight;
    }
    return _timeLb;
}

- (UILabel *)sourceLb {
    if(_sourceLb == nil) {
        _sourceLb = [[UILabel alloc] init];
        [self.contentView addSubview:_sourceLb];
        [_sourceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin).mas_equalTo(0);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(4);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
        }];
        _sourceLb.font = [UIFont systemFontOfSize:15];
        _sourceLb.textColor = [UIColor lightGrayColor];
    }
    return _sourceLb;
}

- (UILabel *)playCountLb {
    if(_playCountLb == nil) {
        _playCountLb = [[UILabel alloc] init];
        [self.contentView addSubview:_playCountLb];
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_play"]];
        [self.contentView addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.leftMargin.mas_equalTo(self.sourceLb.mas_leftMargin);
            make.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.sourceLb.mas_bottom).mas_equalTo(10);
        }];
        [_playCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(image);
            make.left.mas_equalTo(image.mas_right).mas_equalTo(3);
        }];
        _playCountLb.font = [UIFont systemFontOfSize:13];
        _playCountLb.textColor = [UIColor lightGrayColor];
        
    }
    return _playCountLb;
}

- (UILabel *)favorCountLb {
    if(_favorCountLb == nil) {
        _favorCountLb = [[UILabel alloc] init];
        [self.contentView addSubview:_favorCountLb];
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_likes_n"]];
        [self.contentView addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.playCountLb.mas_right).mas_equalTo(7);
            make.centerY.mas_equalTo(self.playCountLb);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        [_favorCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(image.mas_right);
            make.centerY.mas_equalTo(image);
        }];
        _favorCountLb.font = [UIFont systemFontOfSize:13];
        _favorCountLb.textColor = [UIColor lightGrayColor];
    }
    return _favorCountLb;
}

- (UILabel *)commentCountLb {
    if(_commentCountLb == nil) {
        _commentCountLb = [[UILabel alloc] init];
        [self.contentView addSubview:_commentCountLb];
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_comments"]];
        [self.contentView addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.left.mas_equalTo(self.favorCountLb.mas_right).mas_equalTo(7);
            make.centerY.mas_equalTo(self.favorCountLb);
        }];
        [_commentCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(image.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(image);
        }];
        _commentCountLb.font = [UIFont systemFontOfSize:13];
        _commentCountLb.textColor = [UIColor lightGrayColor];
        
    }
    return _commentCountLb;
}


- (UILabel *)durationLb {
    if(_durationLb == nil) {
        _durationLb = [[UILabel alloc] init];
        [self.contentView addSubview:_durationLb];
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_duration"]];
        [self.contentView addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.centerY.mas_equalTo(self.commentCountLb);
            make.left.mas_equalTo(self.commentCountLb.mas_right).mas_equalTo(7);
        }];
        [_durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(image.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(image);
        }];
        _durationLb.font = [UIFont systemFontOfSize:13];
        _durationLb.textColor = [UIColor lightGrayColor];
    }
    return _durationLb;
}

- (UIButton *)downloadBtn {
    if(_downloadBtn == nil) {
        _downloadBtn = [UIButton buttonWithType:0];
        
        [_downloadBtn setBackgroundImage:[UIImage imageNamed:@"cell_download"] forState:0];
        
        [_downloadBtn bk_addEventHandler:^(id sender) {
            DDLogVerbose(@"下载按钮被点击...");
        } forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_downloadBtn];
        [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(-5);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
    return _downloadBtn;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.downloadBtn.hidden = NO;
//设置cell被选中后的背景色
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(243, 255, 254);
        self.selectedBackgroundView = view;
//分割线距离左侧空间
        self.separatorInset = UIEdgeInsetsMake(0, 75, 0, 0);
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
