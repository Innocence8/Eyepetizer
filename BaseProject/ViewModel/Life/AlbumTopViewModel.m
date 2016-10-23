//
//  AlbumTopViewModel.m
//  BaseProject
//
//  Created by liuping on 2016/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumTopViewModel.h"
#import "LifeTopAlbumModel.h"
#import "TopAlbumManager.h"

@interface AlbumTopViewModel ()
@property(nonatomic, strong) LifeTopAlbumDataModel *dataModel;
@property(nonatomic, strong) LifeTopAlbumUserModel *userModel;
@end

@implementation AlbumTopViewModel

/** 获取专辑名称 */
- (NSString *)getName{
    return self.dataModel.name;
}
/** 获取专辑图片数 */
- (NSString *)getPicCount{
    return [NSString stringWithFormat:@"%.0lf张图片", self.dataModel.count];
}
/** 获取专辑收藏数 */
- (NSString *)getFavoriateCount{
    return [NSString stringWithFormat:@"%.0lf人收藏", self.dataModel.favoriteCount];
}
/** 获取用户名 */
- (NSString *)getUserName{
    return [NSString stringWithFormat:@"by %@", self.userModel.username];
    
}

/** 获取头像链接地址 */
- (NSString *)getAvatarURL{
    return self.userModel.avatar;
}


- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TopAlbumManager getAlbumTypeFromPageId:self.albumID CompletionHandle:^(LifeTopAlbumModel *model, NSError *error) {
        if(!error){
            self.dataModel = model.data;
            self.userModel = model.data.user;
        }
        completionHandle(error);
    }];
}


@end
