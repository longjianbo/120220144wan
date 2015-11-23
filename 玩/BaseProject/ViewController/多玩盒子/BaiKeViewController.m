//
//  BaiKeViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiKeViewController.h"
#import "ToolMenuViewModel.h"
#import "DuoWanListCell.h"
#import "TRImageView.h"
#import "TuWanHtmlViewController.h"
#import "BestGroupViewController.h"
#import "ZBCategoryViewController.h"
#import "SumAbilityViewController.h"
/** 创建自定义cell、图+题目 BaiKeCell */

/** 引入tableView的协议 */
@interface BaiKeViewController ()<UITableViewDelegate,UITableViewDataSource>
/** viewmodel */
@property(nonatomic,strong)ToolMenuViewModel *duowanVM;
/** table */
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation BaiKeViewController
/** 实现viewmodel懒加载 */
-(ToolMenuViewModel *)duowanVM{
    if (!_duowanVM) {
        _duowanVM = [ToolMenuViewModel new];
    }
    return _duowanVM;
}
/** 实现tableView懒加载：设置代理、去掉多余cell、头部刷新、注册cell */
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[DuoWanListCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.duowanVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
    }
    return _tableView;
}

/** 实现tableView的协议、去分割线、去选择效果 */

-(id)init{
    if (self = [super init]) {
        self.title = @"游戏百科";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addMenuItemToVC:self];
    [self.tableView.header beginRefreshing];
    [self.view addSubview:_tableView];
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
#pragma mark - UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.duowanVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DuoWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV.imageView setImageWithURL:[self.duowanVM iconForRow:indexPath.row]];
    cell.titleLb.text = [self.duowanVM nameForRow:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.duowanVM typeForRow:indexPath.row] == ToolMenuItemTypeWeb) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc]initWithURL:[self.duowanVM webURLForRow:indexPath.row]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([[self.duowanVM tagForRow:indexPath.row]isEqualToString:@"best_group"]) {
        BestGroupViewController *vc = [BestGroupViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([[self.duowanVM tagForRow:indexPath.row]isEqualToString:@"item"]) {
        ZBCategoryViewController *vc = [ZBCategoryViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([[self.duowanVM tagForRow:indexPath.row]isEqualToString:@"sum_ability"]) {
        SumAbilityViewController *vc = [SumAbilityViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
