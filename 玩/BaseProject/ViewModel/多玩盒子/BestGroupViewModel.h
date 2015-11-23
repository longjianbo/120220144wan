//
//  BestGroupViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface BestGroupViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNumber;
/** 标题 */
-(NSString *)titleForRow:(NSInteger)row;
/** 头像 */
-(NSArray *)iconsURLForRow:(NSInteger)row;
/** 阵容描述 */
-(NSString *)descForRow:(NSInteger)row;
/** 英雄描述 */
-(NSArray *)descsForRow:(NSInteger)row;

@end
