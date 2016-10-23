//
//  LifeNetManager.m
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LifeNetManager.h"
#define kLifePath @"http://www.duitang.com/napi/ad/banner/list/?platform_name=iOS&start=%@"
#define tailPath @"&query_type=normal&__domain=www.duitang.com&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=0&ad_id=IGA009&screen_width=375"

@implementation LifeNetManager
+ (id)getDataFromPage:(NSInteger)pageId CompletionHandle:(void (^)(LifeModel *, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:kLifePath, @(pageId)];
    path = [path stringByAppendingString:tailPath];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LifeModel objectWithKeyValues:responseObj], error);
    }];
}
@end
