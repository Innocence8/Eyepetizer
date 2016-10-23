//
//  NewsModel.m
//  BaseProject
//
//  Created by AHJD-12 on 16/9/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
//MJ会自动判断某个key对应的属性是什么类型，如果是字典类型，则会通过与这个key相同的名称的类型 进行解析

@end

@implementation NewsResultModel
+ (NSDictionary *)objectClassInArray{
    // key 需要填 属性, 表示某个数组属性中的元素对应的特殊解析类
    return @{@"focusimg":[NewsResultFocusimgModel class], @"anewslist":[NewsResultNewslistModel class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"anewslist": @"newslist"};
}

@end

@implementation NewsResultFocusimgModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id"};
}
@end

@implementation NewsResultHeadlineinfoModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id"};
}
@end

@implementation NewsResultNewslistModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"anewstype":@"newstype"};
}
@end

@implementation NewsResultHeadTopnewsinfoModel
@end





