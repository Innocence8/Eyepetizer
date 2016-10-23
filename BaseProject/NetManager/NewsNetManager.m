//
//  NewsNetManager.m
//  BaseProject
//
//  Created by AHJD-12 on 16/9/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NewsNetManager.h"

@implementation NewsNetManager

+ (id)getNewsListType:(NewsListType)type lastTime:(NSString *)time page:(NSInteger)page completionHandle:(void (^)(NewsModel *, NSError *))completionHandle{
    //需要根据不同类型 ，设置对应的请求地址
    NSString *path = nil;
    //修改链接地址为 p%@  l%@ ,对应@（page), time
    switch (type) {
        case NewsListTypeJiShu:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt102-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeYouJi:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt100-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeDaoGou:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt60-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypePingCe:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt3-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeWenHua:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt97-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeXinWen:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt1-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeZuiXin:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt0-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeYongChe:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt82-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeHangQing:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c110100-nt2-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeGaiZhuang:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt107-p%@-s30-l%@.json", @(page), time];
            break;
        default:
            break;
    }
    //只要请求下来的数据公用一个解析类，就可以合写
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([NewsModel objectWithKeyValues:responseObj], error);
    }];
}

@end
