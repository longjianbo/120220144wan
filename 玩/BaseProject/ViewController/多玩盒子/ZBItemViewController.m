//
//  ZBItemViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemViewController.h"
#import "ZBItemViewModel.h"
#import "TRImageView.h"
@interface ZBItemViewCell : UICollectionViewCell
@property(nonatomic,strong)TRImageView *iconImage;
@property(nonatomic,strong)UILabel *textLb;

@end

@implementation ZBItemViewCell


- (TRImageView *)iconImage {
    if(_iconImage == nil) {
        _iconImage = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(_iconImage.mas_width);
        }];
    }
    return _iconImage;
}

- (UILabel *)textLb {
    if(_textLb == nil) {
        _textLb = [[UILabel alloc] init];
        _textLb.font = [UIFont systemFontOfSize:15];
        _textLb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_textLb];
        [_textLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
        }];
    }
    return _textLb;
}

@end




@interface ZBItemViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)ZBItemViewModel *itemVM;
@end

@implementation ZBItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView.header beginRefreshing];
}

-(id)initWithTag:(NSString *)tag text:(NSString *)text{
    if (self = [super init]) {
        self.tag = tag;
        self.title = text;
        [Factory addBackItemToVC:self];
    }
    return self;
}


#pragma mark - UICollectionView
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemVM.rowNumber;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBItemViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconImage.imageView setImageWithURL:[self.itemVM itemIconURLForRow:indexPath.row]];
    cell.textLb.text = [self.itemVM itemTextForRow:indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLaout
/** section的上下左右边距 */
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
/** 最小行间距 */

/** 最小列间距 */

/** 每格cell的宽高 */
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 5*20)/4;
    CGFloat height = width + 17;
    return CGSizeMake(width, height);
}


-(ZBItemViewModel *)itemVM{
    if (_itemVM == nil) {
        _itemVM = [[ZBItemViewModel alloc]initWithTag:self.tag];
    }
    return _itemVM;
}

-(UICollectionView *)collectionView{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.itemVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.header endRefreshing];
            }];
        }];
        [_collectionView registerClass:[ZBItemViewCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}
@end
