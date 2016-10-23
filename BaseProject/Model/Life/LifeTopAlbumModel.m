//
//  LifeAlbumModel.m
//  BaseProject
//
//  Created by liuping on 2016/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LifeTopAlbumModel.h"

@implementation LifeTopAlbumModel

@end


@implementation LifeTopAlbumDataModel
+ (NSDictionary *)objectClassInArray{
    return @{@"tags" : [LifeTopAlbumTagesModel class]};
}
//underlineFromCamel：将LoveYou转换为love_you
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


@implementation LifeTopAlbumSharLinks3Model

@end


@implementation LifeTopAlbumUserModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


@implementation LifeTopAlbumTagesModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end
