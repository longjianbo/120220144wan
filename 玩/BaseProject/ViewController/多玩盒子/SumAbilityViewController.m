//
//  SumAbilityViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityViewController.h"
#import "SumAbilityViewModel.h"
#import "TRImageView.h"
@interface SumAbilityCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)TRImageView *sumImage;
@property(nonatomic,strong)UILabel *sumTitle;
@end
@implementation SumAbilityCollectionViewCell
- (TRImageView *)sumImage {
    if(_sumImage == nil) {
        _sumImage = [[TRImageView alloc] init];
        [self.contentView addSubview:_sumImage];
        [_sumImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(_sumImage.mas_width);
        }];
    }
    return _sumImage;
}

- (UILabel *)sumTitle {
    if(_sumTitle == nil) {
        _sumTitle = [[UILabel alloc] init];
        _sumTitle.font = [UIFont systemFontOfSize:15];
        _sumTitle.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_sumTitle];
        [_sumTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
        }];
    }
    return _sumTitle;
}

@end

@interface SumAbilityViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)SumAbilityViewModel *sumAbilityVM;
@end

@implementation SumAbilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView.header beginRefreshing];
}

#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.sumAbilityVM.rowNumber;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SumAbilityCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.sumImage.imageView setImageWithURL:[self.sumAbilityVM sumIconForRow:indexPath.row]];
    cell.sumTitle.text = [self.sumAbilityVM sumTitleForRow:indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLaout
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW -5*20)/4;
    CGFloat height = width + 17;
    return CGSizeMake(width, height);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(SumAbilityViewModel *)sumAbilityVM{
    if (!_sumAbilityVM) {
        _sumAbilityVM = [SumAbilityViewModel new];
    }
    return _sumAbilityVM;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.sumAbilityVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.header endRefreshing];
            }];
        }];
        [_collectionView registerClass:[SumAbilityCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}


@end
