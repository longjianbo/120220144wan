//
//  BestGroupCell.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface BestGroupCell : UITableViewCell

/** 标题 */
@property(nonatomic,strong)UILabel *titleLb;
/** 头像 */
@property(nonatomic,strong)TRImageView *icon1;
@property(nonatomic,strong)TRImageView *icon2;
@property(nonatomic,strong)TRImageView *icon3;
@property(nonatomic,strong)TRImageView *icon4;
@property(nonatomic,strong)TRImageView *icon5;

/** 阵容描述 */
@property(nonatomic,strong)UILabel *descLb;
@end
