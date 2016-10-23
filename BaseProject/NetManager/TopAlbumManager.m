//
//  LifeAlbumManager.m
//  BaseProject
//
//  Created by liuping on 2016/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopAlbumManager.h"


#define kLifeAlbumTopPath @"http://www.duitang.com/napi/album/detail/?platform_name=iOS&__domain=www.duitang.com&include_fields=id%2Cname%2Cdesc%2Cuser%2Clike_count%2Clike_id%2Ccount%2Ccovers%2Cmanagers%2Cmembers%2Cmember_count%2Ccategory%2Cshare_links_3&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&user_id=0&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&screen_width=375&"
#define tailPath @"album_id=%@"

@implementation TopAlbumManager

+ (id)getAlbumTypeFromPageId:(NSInteger)pageId CompletionHandle:(void (^)(LifeTopAlbumModel *, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:tailPath, @(pageId)];
    path = [kLifeAlbumTopPath stringByAppendingString:path];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LifeTopAlbumModel objectWithKeyValues:responseObj], error);
    }];
}
@end
