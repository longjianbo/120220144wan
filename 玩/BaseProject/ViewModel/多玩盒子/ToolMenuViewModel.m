//
//  ToolMenuViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ToolMenuViewModel.h"
#import "DuoWanNetManager.h"
@implementation ToolMenuViewModel

/** 不是分页 只实现getData方法即可 */
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getToolMenuCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(ToolMenuModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSURL *)iconForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].icon];
}
-(NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
-(NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}
-(ToolMenuItemType)typeForRow:(NSInteger)row{
    NSString *type = [self modelForRow:row].type;
    if ([type isEqualToString:@"native"]) {
        return ToolMenuItemTypeNative;
    }
    if ([type isEqualToString:@"web"]) {
        return ToolMenuItemTypeWeb;
    }
    return 0;
}
-(NSURL *)webURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}
@end
