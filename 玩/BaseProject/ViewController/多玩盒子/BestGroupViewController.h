//
//  BestGroupViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//
/*
 制作步骤：
 1.创建BestGroupViewModel
    只需要实现getData就可以了，没有分页问题
 2.创建BestGroupCell，继承UITableViewCell
    头像的大小孤星，间距使用（window宽-5*图片宽）/6 获得
 3.BestGroupViewController制作
    对于cell高度：只需要实现estimatedHeightForRow协议即可自动适应
 4.在BaiKeViewController的cell点击事件中判断 vm层的tag值是best_group  则跳转
 */

#import <UIKit/UIKit.h>

@interface BestGroupViewController : UIViewController

@end
