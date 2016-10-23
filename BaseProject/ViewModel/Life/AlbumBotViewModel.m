//
//  AlbumBotViewModel.m
//  BaseProject
//
//  Created by liuping on 2016/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumBotViewModel.h"
#import "LifeBotAlbumModel.h"
#import "BotAlbumNetManager.h"

@interface AlbumBotViewModel ()
//@property(nonatomic, strong)LifeBotAlbumDataObjectListModel *objectListModel;
@end

@implementation AlbumBotViewModel
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (LifeBotAlbumDataObjectListModel *)objectListModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (LifeBotAlbumDataObjectListPhotoModel *)objectListPhotoModelForRow:(NSInteger)row{
   LifeBotAlbumDataObjectListModel *model =  self.dataArr[row];
    return model.photo;
}

/** 获取某行的封面图片URL */
- (NSURL *)phototURLForRow:(NSInteger)row{
    NSString *path = [self objectListPhotoModelForRow:row].path;
    path = [path substringToIndex:path.length - 5];
    return [NSURL URLWithString:path];
}
/** 获取某行内容描述 */
- (NSString *)msgForRow:(NSInteger)row{
    return [self objectListModelForRow:row].msg;
}
/** 获取某行回复数 */
- (NSString *)replyCountForRow:(NSInteger)row{
    return [self objectListModelForRow:row].replyCount;
}
/** 获取某行回复数 */
- (NSString *)replyLifeBotAlbumDataObjectListPhotoModelCountForRow:(NSInteger)row{
    return [self objectListModelForRow:row].replyCount;
}
/** 获取某行点赞数 */
- (NSString *)likeCountForRow:(NSInteger)row{
    return [self objectListModelForRow:row].likeCount;
}
/** 获取某行创建时间 */
- (NSString *)disabledAtStrForRow:(NSInteger)row{
    return [self objectListModelForRow:row].addDatetime;
}
/** 获取某行收藏数 */
- (NSString *)favoriteCountfoForRow:(NSInteger)row{
    return [self objectListModelForRow:row].favoriteCount;
}
/** 获取某张图片高度 */
- (CGFloat)photoHForRow:(NSInteger)row{
    return 172.5;
}
/** 获取某张图片宽度 */
- (CGFloat)photoWForRow:(NSInteger)row{
    CGFloat height = [self objectListPhotoModelForRow:row].height.floatValue;
    CGFloat width = [self objectListPhotoModelForRow:row].width.floatValue;
    return height/(width/172.5);
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [BotAlbumNetManager getAlbumContentFromPageId:_pageId CompletionHandle:^(LifeBotAlbumModel *model, NSError *error) {
        if (!error) {
            
//            for (LifeBotAlbumDataObjectListModel *obj in model.data.objectList) {
//                [self.dataArr addObject:obj];
//                LifeBotAlbumDataObjectListPhotoModel *photoModel = [LifeBotAlbumDataObjectListPhotoModel new];
//                photoModel = obj.photo;
//                //NSLog(@".......................%@  %@", photoModel.width, photoModel.height);
            
//            }
        }
        [self.dataArr addObjectsFromArray:model.data.objectList];
         completionHandle(error);
    }];
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
@end
