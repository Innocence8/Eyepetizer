//
//  VideoCell.m
//  BaseProject
//
//  Created by liuping on 2016/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "VideoCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@implementation VideoCell

//为了保证同一时间只有一个播放器，使用单例模式
+ (AVPlayerViewController *)sharedInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (IBAction)play:(id)sender {
    AVPlayer *player = [AVPlayer playerWithURL:self.videoURL];
    [player play];
    [VideoCell sharedInstance].player = player;
    //将播放器视图加到按钮上
    [sender addSubview:[VideoCell sharedInstance].view];
    //给播放器视图加约束，视图和按钮大小一样
    [[VideoCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}


//如果cell被复用了，需要把cell上的播放器删除
- (void)prepareForReuse{
    [super prepareForReuse];
    //判断当前cell是否有播放，如果有则删除（自己想办法）
    [[VideoCell sharedInstance].view removeFromSuperview];
    [VideoCell sharedInstance].player = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}

@end
