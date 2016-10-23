//
//  VideoNetManager.m
//  BaseProject
//
//  Created by liuping on 2016/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//


#import "VideoNetManager.h"


@implementation VideoNetManager

+ (id)getVideoWithIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle{
    
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html", (long)index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideoModel objectWithKeyValues:responseObj], error);
    }];
}
@end
