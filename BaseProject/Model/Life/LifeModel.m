//
//  LifeModel.m
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LifeModel.h"

@implementation LifeModel

@end


@implementation LifeDataModel
+ (NSDictionary *)objectClassInArray{
    return @{@"objectList" : [LifeDataObjectListModel class]};
}

+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


@implementation LifeDataObjectListModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"contentCategory":@"content_category",
             @"contentType":@"content_type",
             @"desc":@"description",
             @"disabledAt":@"disabled_at",
             @"disabledAtStr":@"disabled_at_str",
             @"dynamicInfo":@"dynamic_info",
             @"dynamicInfo2":@"dynamic_info2",
             @"iconUrl":@"icon_url",
             @"iconUrl2":@"icon_url2",
             @"imageUrl":@"image_url",
             };
}

@end




@implementation LifeDataObjectListColumnModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


