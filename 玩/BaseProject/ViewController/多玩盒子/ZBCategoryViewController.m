//
//  ZBCategoryViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewController.h"
#import "ZBCategoryCell.h"
#import "ZBCategoryViewModel.h"
#import "ZBItemViewController.h"
@interface ZBCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)ZBCategoryViewModel *zbCategoryVM;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ZBCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"装备分类";
    //[self.view addSubview:self.tableView];
    [self.tableView.header beginRefreshing];
}
-(ZBCategoryViewModel *)zbCategoryVM{
    if (!_zbCategoryVM) {
        _zbCategoryVM = [ZBCategoryViewModel new];
    }
    return _zbCategoryVM;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ZBCategoryCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.zbCategoryVM getDataFromNetCompleteHandle:^(NSError *error) {
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.zbCategoryVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.zbText.text = [self.zbCategoryVM textForRow:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZBItemViewController *vc = [[ZBItemViewController alloc]initWithTag:[self.zbCategoryVM tagForRow:indexPath.row] text:[self.zbCategoryVM textForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
