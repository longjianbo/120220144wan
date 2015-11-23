//
//  MusicListViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicListViewController : UIViewController
-(instancetype)initWithAlbumId:(NSInteger)albumId;
@property(nonatomic)NSInteger albumId;
@end
