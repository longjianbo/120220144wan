//
//  BestGroupDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//
/*
制作步骤
 1.数据的传入：通过在BestGroupViewController中点击任意cell，获得到对应的BestGroupModel类型对象
 2.整体是一个tableView  是group风格 两个section
 3.由tableheaderView，负责显示团队简介
 4.另一种负责 显示每个角色的简介
 5.Cell选中以后是浅黄色，色值自己量取
 
 */



#import <UIKit/UIKit.h>

@interface BestGroupDetailViewController : UIViewController
@property(nonatomic,strong)NSString *titleNumber;
@property(nonatomic,strong)NSString *desNumber;

@property(nonatomic,strong)NSArray *iconsImage;
@property(nonatomic,strong)NSArray *desImage;
@end
