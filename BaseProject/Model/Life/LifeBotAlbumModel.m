//
//  LifeBottomAlbumModel.m
//  BaseProject
//
//  Created by liuping on 2016/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LifeBotAlbumModel.h"

@implementation LifeBotAlbumModel

@end

@implementation LifeBotAlbumDataModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}

+ (NSDictionary *)objectClassInArray{
    return @{@"objectList" : [LifeBotAlbumDataObjectListModel class]};
}
@end


@implementation LifeBotAlbumDataObjectListModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


@implementation LifeBotAlbumDataObjectListAlbumModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


@implementation LifeBotAlbumDataObjectListPhotoModel

@end

@implementation LifeBotAlbumDataObjectListSenderModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end
