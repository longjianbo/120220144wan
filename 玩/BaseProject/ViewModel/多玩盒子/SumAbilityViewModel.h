//
//  SumAbilityViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface SumAbilityViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNumber;
/** 召唤师技能图片 */
-(NSURL *)sumIconForRow:(NSInteger)row;
/** 召唤师技能文本 */
-(NSString *)sumTitleForRow:(NSInteger)row;

-(NSString *)sumIdForRow:(NSInteger)row;


@end
