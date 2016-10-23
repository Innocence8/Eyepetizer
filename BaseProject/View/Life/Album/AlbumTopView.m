//
//  AlbumTopView.m
//  BaseProject
//
//  Created by liuping on 2016/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumTopView.h"

@implementation AlbumTopView

- (void)setAvatarIV:(UIImageView *)avatarIV{
    _avatarIV = avatarIV;
    _avatarIV.layer.cornerRadius = 20;
    _avatarIV.layer.masksToBounds = YES;
}
@end
