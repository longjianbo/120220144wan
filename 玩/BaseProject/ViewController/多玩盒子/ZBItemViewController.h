//
//  ZBItemViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ZBItemViewController : UIViewController

-(id)initWithTag:(NSString *)tag text:(NSString *)text;

@property(nonatomic,strong)NSString *tag;
@end
