//
//  AlbumTopViewModel.h
//  BaseProject
//
//  Created by liuping on 2016/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface AlbumTopViewModel : BaseViewModel
/** 当前请求页数 */
@property(nonatomic) NSInteger albumID;

/** 获取专辑名称 */
- (NSString *)getName;
/** 获取专辑图片数 */
- (NSString *)getPicCount;
/** 获取专辑收藏数 */
- (NSString *)getFavoriateCount;
/** 获取用户名 */
- (NSString *)getUserName;
/** 获取头像链接地址 */
- (NSString *)getAvatarURL;

@end
