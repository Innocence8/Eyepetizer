//
//  LifeViewModel.m
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LifeViewModel.h"
#import "LifeModel.h"

@implementation LifeViewModel
/** 行数 */
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (LifeDataObjectListModel *)lifeModelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/** 获取某行的封面图片URL */
- (NSURL *)imageURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self lifeModelForRow:row].imageUrl];
}
/** 获取某行内容描述 */
- (NSString *)descriptionForRow:(NSInteger)row{
    return [self lifeModelForRow:row].desc;
}
/** 获取每行分类 */
- (NSString *)CategoryForRow:(NSInteger)row{
    return [self lifeModelForRow:row].contentCategory;
}
/** 获取每行内容类型 */
- (NSString *)contentTypeForRow:(NSInteger)row{
    return [self lifeModelForRow:row].contentType;
}
/** 获取某行创建时间 */
- (NSString *)disabledAtStrForRow:(NSInteger)row{
    return [self lifeModelForRow:row].disabledAtStr;
}
/** 获取某行浏览数 */
- (NSString *)dynamicInfoForRow:(NSInteger)row{
    return [self lifeModelForRow:row].dynamicInfo;
}
/** 获取某行收藏数 */
- (NSString *)dynamicInfo2ForRow:(NSInteger)row{
    return [self lifeModelForRow:row].dynamicInfo2;
}
/** 获取昵称 */
- (NSString *)nicNameForRow:(NSInteger)row{
    return [self lifeModelForRow:row].nickname;
}
/** 获取日期 */
- (NSString *)dateForRow:(NSInteger)row{
    NSString *path = [self lifeModelForRow:row].disabledAtStr;
    NSInteger length = path.length;
    return [path substringToIndex:length - 8];
}
/** 风格：大图还是小图 */
- (BOOL)isBigPic:(NSInteger)row{
    return [[self lifeModelForRow:row].style isEqualToString:@"large"];
}
/** 是否有时间标签 */
- (BOOL)hasDateLabel:(NSInteger)row{
    return [[self lifeModelForRow:row].disabledAtStr isEqualToString:@"%s00:00:00"];
}
/** 是否有竖线分开 */
- (BOOL)hasSeparateView:(NSInteger)row{
    return [[self lifeModelForRow:row].nickname isEqualToString:@""];
}
/** 获取文章类型target最后的ID */
- (NSString *)getIDForRow:(NSInteger)row{
    NSString *path = [self lifeModelForRow:row].target;
    NSInteger length = path.length;
    return [path substringFromIndex:length - 6];
}
/** 获取某行创建时间最后的时分秒 */
- (NSString *)getTimeForRow:(NSInteger)row{
    NSString *path = [self lifeModelForRow:row].disabledAtStr;
    NSInteger length = path.length;
    return [path substringFromIndex:length - 8];
}

/** 获取专辑类型target最后的ID */
- (NSString *)getAlbumIDForRow:(NSInteger)row{
    NSString *path = [self lifeModelForRow:row].target;
    NSInteger length = path.length;
    return [path substringFromIndex:length - 8];
}

/** 获取商店类型的地址 */
- (NSString *)getStorePathForRow:(NSInteger)row{
    return [self lifeModelForRow:row].target;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId += 30;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [LifeNetManager getDataFromPage:_pageId CompletionHandle:^(LifeModel *model, NSError *error) {
        if (!error) {
            if (!_pageId) {
                [self.dataArr removeAllObjects];
            }
            LifeDataModel *dataModel = [LifeDataModel new];
            dataModel = model.data;
            [self.dataArr addObjectsFromArray:dataModel.objectList];
        }
        completionHandle(error);
    }];
}

@end
