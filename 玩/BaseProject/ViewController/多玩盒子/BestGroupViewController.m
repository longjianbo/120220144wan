//
//  BestGroupViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewController.h"
#import "BestGroupViewModel.h"
#import "BestGroupCell.h"
#import "BestGroupDetailViewController.h"
@interface BestGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BestGroupViewModel *bestgroupVM;
@end

@implementation BestGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"最佳阵容";
    [self.tableView.header beginRefreshing];
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(BestGroupViewModel *)bestgroupVM{
    if (!_bestgroupVM) {
        _bestgroupVM = [BestGroupViewModel new];
    }
    return _bestgroupVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.bestgroupVM getDataFromNetCompleteHandle:^(NSError *error) {
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

#pragma mark - UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bestgroupVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.bestgroupVM titleForRow:indexPath.row];
    NSArray *arr = [self.bestgroupVM iconsURLForRow:indexPath.row];
    [cell.icon1.imageView setImageWithURL:[NSURL URLWithString:arr[0]]];
    [cell.icon2.imageView setImageWithURL:[NSURL URLWithString:arr[1]]];
    [cell.icon3.imageView setImageWithURL:[NSURL URLWithString:arr[2]]];
    [cell.icon4.imageView setImageWithURL:[NSURL URLWithString:arr[3]]];
    [cell.icon5.imageView setImageWithURL:[NSURL URLWithString:arr[4]]];
    cell.descLb.text = [self.bestgroupVM descForRow:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupDetailViewController *vc = [BestGroupDetailViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    vc.titleNumber = [self.bestgroupVM titleForRow:indexPath.row];
    vc.desNumber = [self.bestgroupVM descForRow:indexPath.row];
    vc.iconsImage = [self.bestgroupVM iconsURLForRow:indexPath.row];
    vc.desImage = [self.bestgroupVM descsForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
