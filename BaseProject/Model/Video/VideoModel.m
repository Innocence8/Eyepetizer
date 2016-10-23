//
//  VideoModel.m
//  BaseProject
//
//  Created by liuping on 2016/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "VideoModel.h"


@implementation VideoModel
//定义两个数组对象中的元素对应的解析类
+ (NSDictionary *)objectClassInArray{
    return @{@"videoSidList":[VideoVideoSidListModel class],
             @"videoList":[VideoVideoListModel class]};
}
@end


@implementation VideoVideoListModel
//因为服务器传入串的key是description系统关键词。属性命名不能是系统关键词，改为desc。改动后需要通知MJExtension
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"desc": @"description",
             @"m3u8Url": @"m3u8_url",
             @"m3u8HdUrl":@"m3u8Hd_url",
             @"mp4Url":@"mp4_url",
             @"mp4HdUrl":@"mp4Hd_url"
             };
}
/*下方函数需要服务器人员 代码规范，十分严谨， 可以参考多玩直播游戏列表
 //快捷的把 例如m3u8_url属性转为 m3u8Url
 //underlineFromCamel：将LoveYou转换为love_you
 + (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
 return [propertyName underlineFromCamel];
 }
 */
@end


@implementation VideoVideoSidListModel



@end

