//
//  SumAbilityViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityViewModel.h"

@implementation SumAbilityViewModel


-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(SumAbilityModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSString *)sumTitleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
-(NSURL *)sumIconForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png",[self modelForRow:row].ID]];
}
-(NSString *)sumIdForRow:(NSInteger)row{
    return [self modelForRow:row].ID;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getSumAbilityCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
            completionHandle(error);
        }
    }];
}
@end
