//
//  BestGroupDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupDetailViewController.h"
#import "BestGroupViewModel.h"
#import "BestGroupDetailCell.h"
@interface BestGroupDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation BestGroupDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"阵容详情";
    [self.tableView.header beginRefreshing];
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[BestGroupDetailCell class] forCellReuseIdentifier:@"detailCell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    return _tableView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
#pragma mark - UITableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.iconsImage.count;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        BestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        cell.titleLb.text = _titleNumber;
        cell.descLb.text = _desNumber;
        cell.descLb.numberOfLines = 0;
        
        [cell.icon1.imageView setImageWithURL:[NSURL URLWithString:self.iconsImage[0]]];
        [cell.icon2.imageView setImageWithURL:[NSURL URLWithString:self.iconsImage[1]]];
        [cell.icon3.imageView setImageWithURL:[NSURL URLWithString:self.iconsImage[2]]];
        [cell.icon4.imageView setImageWithURL:[NSURL URLWithString:self.iconsImage[3]]];
        [cell.icon5.imageView setImageWithURL:[NSURL URLWithString:self.iconsImage[4]]];
        return cell;
    }else{
        BestGroupDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"];
        
        [cell.imageLb.imageView setImageWithURL:[NSURL URLWithString:self.iconsImage[indexPath.row]]];
       
        cell.desLb.text = _desImage[indexPath.row];
        return cell;
    
    
    }
}
@end
