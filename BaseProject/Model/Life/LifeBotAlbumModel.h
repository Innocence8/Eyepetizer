//
//  LifeBottomAlbumModel.h
//  BaseProject
//
//  Created by liuping on 2016/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class LifeBotAlbumDataModel, LifeBotAlbumDataObjectListAlbumModel, LifeBotAlbumDataObjectListSenderModel, LifeBotAlbumDataObjectListPhotoModel;

@interface LifeBotAlbumModel : BaseModel
@property (nonatomic, assign) double status;
@property (nonatomic, strong) LifeBotAlbumDataModel *data;
@end


@interface LifeBotAlbumDataModel : BaseModel
@property (nonatomic, assign) double more;
@property (nonatomic, strong) NSArray *objectList;
@property (nonatomic, assign) double nextStart;
@property (nonatomic, assign) double total;
@property (nonatomic, assign) double limit;
@end


@interface LifeBotAlbumDataObjectListModel : BaseModel
@property (nonatomic, assign) double ID;
@property (nonatomic, assign) double senderId;
@property (nonatomic, strong) LifeBotAlbumDataObjectListAlbumModel *album;
@property (nonatomic, strong) NSString *addDatetime;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *favoriteCount;
@property (nonatomic, assign) double buyable;
@property (nonatomic, strong) NSString *addDatetimePretty;
@property (nonatomic, strong) NSString *sourceLink;
@property (nonatomic, assign) double addDatetimeTs;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *likeCount;
@property (nonatomic, strong) NSString *extraType;
@property (nonatomic, strong) NSString *replyCount;
@property (nonatomic, strong) LifeBotAlbumDataObjectListSenderModel *sender;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) LifeBotAlbumDataObjectListPhotoModel *photo;
@end

@interface LifeBotAlbumDataObjectListAlbumModel : BaseModel
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSArray *covers;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, assign) double albumIdentifier;
@property (nonatomic, assign) double category;
@property (nonatomic, assign) double count;
@property (nonatomic, assign) double activedAt;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, assign) double favoriteId;
@property (nonatomic, strong) NSString *name;

@end

@interface LifeBotAlbumDataObjectListPhotoModel : BaseModel
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *height;
@end

@interface LifeBotAlbumDataObjectListSenderModel : BaseModel
@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double ID;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;
@end
