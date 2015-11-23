//
//  ZBCategoryViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface ZBCategoryViewModel : BaseViewModel

@property(nonatomic)NSInteger rowNumber;

/** 装备文本 */
-(NSString *)textForRow:(NSInteger)row;

/** tag值 */
-(NSString *)tagForRow:(NSInteger)row;
@end
