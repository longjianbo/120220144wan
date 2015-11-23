//
//  PlayView.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface PlayView : UIView

+(PlayView *)sharedInstance;

@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)UIButton *playBtn;

//点击后播放或者暂停
-(void)playWithURL:(NSURL *)musicURL;

@end
