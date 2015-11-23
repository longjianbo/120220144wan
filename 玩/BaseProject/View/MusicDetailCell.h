//
//  MusicDetailCell.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface MusicDetailCell : UITableViewCell
/** 原则上.h文件中只存放需要被调用get或者set方法的属性 */


/** 音乐封面图 */
@property(nonatomic,strong)TRImageView *coverIV;
/** 题目标签 */
@property(nonatomic,strong)UILabel *titleLb;
/** 添加时间标签 */
@property(nonatomic,strong)UILabel *timeLb;
/** 音乐来源 */
@property(nonatomic,strong)UILabel *sourceLb;
/** 播放次数 */
@property(nonatomic,strong)UILabel *playCountLb;
/** 喜欢 */
@property(nonatomic,strong)UILabel *favorCountLb;
/** 评论*/
@property(nonatomic,strong)UILabel *commentCountLb;
/** 时长 */
@property(nonatomic,strong)UILabel *durationLb;
/** 下载按钮 */
@property(nonatomic,strong)UIButton *downloadBtn;

@end
