//
//  VideoViewModel.m
//  BaseProject
//
//  Created by liuping on 2016/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "VideoViewModel.h"

@implementation VideoViewModel
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (VideoVideoListModel *)videoListModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self videoListModelForRow:row].title;
}

- (NSString *)descForRow:(NSInteger)row{
    return [self videoListModelForRow:row].desc;
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    NSString *path = [self videoListModelForRow:row].cover;
    return [NSURL URLWithString:path];
}

- (NSURL *)videoURLForRow:(NSInteger)row{
    NSString *path = [self videoListModelForRow:row].mp4Url;
    return [NSURL URLWithString:path];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [VideoNetManager getVideoWithIndex:_index completionHandle:^(VideoModel *model, NSError *error) {
        if (_index == 0) {
            [self.dataArr removeAllObjects];
        }
        //隐式转换 *m = (VideoModel *)model;
        [self.dataArr addObjectsFromArray:model.videoList];
        completionHandle(error);
    }];
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _index = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _index += 10;
    [self getDataFromNetCompleteHandle:completionHandle];
}

@end
