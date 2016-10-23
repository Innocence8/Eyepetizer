//
//  BotAlbumNetManager.m
//  BaseProject
//
//  Created by liuping on 2016/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BotAlbumNetManager.h"
#define kLifeAlbumBotPath @"http://221.228.82.178/napi/blog/list/by_album/?platform_name=iOS&start=0&__domain=www.duitang.com&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&user_id=11789727&app_code=gandalf&locale=zh_CN&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=0&screen_width=375&album_id=78856204&sender_"
#define tailPath @"id=%@"

@implementation BotAlbumNetManager
+ (id)getAlbumContentFromPageId:(NSInteger)pageId CompletionHandle:(void(^)(LifeBotAlbumModel *model, NSError *error))compeltionHandle{
    NSString *path = [NSString stringWithFormat:tailPath, @(pageId)];
    path = [kLifeAlbumBotPath stringByAppendingString:path];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        compeltionHandle([LifeBotAlbumModel objectWithKeyValues:responseObj], error);
    }];
}
@end
