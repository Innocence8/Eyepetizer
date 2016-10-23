//
//  LifeAlbumModel.h
//  BaseProject
//
//  Created by liuping on 2016/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class LifeTopAlbumDataModel,LifeTopAlbumSharLinks3Model,LifeTopAlbumUserModel;

@interface LifeTopAlbumModel : BaseModel
@property (nonatomic, assign) double status;
@property (nonatomic, strong) LifeTopAlbumDataModel *data;
@end


@interface LifeTopAlbumDataModel : BaseModel
@property (nonatomic, strong) NSArray *covers;
@property (nonatomic, assign) double activedAt;
@property (nonatomic, assign) NSString *ID;
@property (nonatomic, assign) double category;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, assign) double favoriteId;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) LifeTopAlbumSharLinks3Model *shareLinks3;
@property (nonatomic, strong) NSString *likeCount;
@property (nonatomic, strong) LifeTopAlbumUserModel *user;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) double likeId;
@end


@interface LifeTopAlbumSharLinks3Model : BaseModel
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *system;
@property (nonatomic, strong) NSString *weibo;
@property (nonatomic, strong) NSString *weixin;
@property (nonatomic, strong) NSString *qzone;
@property (nonatomic, strong) NSString *weixinpengyouquan;
@end


@interface LifeTopAlbumUserModel : BaseModel
@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double ID;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;
@end


@interface LifeTopAlbumTagesModel : BaseModel
@property (nonatomic, assign) double tagId;
@property (nonatomic, assign) double ID;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *target;
@end
