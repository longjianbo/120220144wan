//
//  ZBItemViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBItemViewModel : BaseViewModel
-(id)initWithTag:(NSString *)tag;
@property(nonatomic,strong)NSString *tag;
@property(nonatomic)NSInteger rowNumber;
/** 图片 */
-(NSURL *)itemIconURLForRow:(NSInteger)row;
/** 装备名 */
-(NSString *)itemTextForRow:(NSInteger)row;

-(NSInteger)itemIdForRow:(NSInteger)row;
@end
