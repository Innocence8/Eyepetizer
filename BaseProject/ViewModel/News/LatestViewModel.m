//
//  LatestViewModel.m
//  BaseProject
//
//  Created by liuping on 2016/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LatestViewModel.h"
@implementation LatestViewModel
-(id)initWithNewsListType:(NewsListType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}


- (NSInteger)rowNumber{
    return self.dataArray.count;
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

- (NewsResultNewslistModel *)newsListModelForRow:(NSInteger)row{
    return self.dataArray[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self newsListModelForRow:row].smallpic];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self newsListModelForRow:row].title;
}
- (NSString *)dateForRow:(NSInteger)row{
    return [self newsListModelForRow:row].time;
}
- (NSString *)commentNumberForRow:(NSInteger)row{
    return [[self newsListModelForRow:row].replycount.stringValue stringByAppendingString:@"评论"];
}
- (NSNumber *)IDForRow:(NSInteger)row{
    return [self newsListModelForRow:row].ID;
}

- (void)getDataCompleteHandle:(void (^)(NSError *))complete{
    [NewsNetManager getNewsListType:_type lastTime:_updateTime page:_page completionHandle:^(NewsModel *model, NSError *error) {
        
        if ([_updateTime isEqualToString:@"0"]) {
            [self.dataArray removeAllObjects];
        }
        [self.dataArray addObjectsFromArray:model.result.anewslist];
        
        NSMutableArray *imgArr =[NSMutableArray new];
        for (NewsResultFocusimgModel *obj in model.result.focusimg) {
            NSURL *imageURL=[NSURL URLWithString:obj.imgurl];
            [imgArr addObject:imageURL];
        }
        self.headImageURLs = [imgArr copy];
        complete(error);
        
    }];
}

- (void)refreshDataCompleteHandle:(void (^)(NSError *))complete{
    _updateTime = @"0";
    _page = 1;
    [self getDataCompleteHandle:complete];
}

- (void)getMoreDataCompleteHandle:(void (^)(NSError *))complete{
    NewsResultNewslistModel *obj=self.dataArray.lastObject;
    _updateTime = obj.lasttime;
    _page += 1;
    [self getDataCompleteHandle:complete];
}


@end

