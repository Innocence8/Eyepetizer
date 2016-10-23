//
//  BotAlbumNetManager.h
//  BaseProject
//
//  Created by liuping on 2016/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "LifeBotAlbumModel.h"

@interface BotAlbumNetManager : BaseNetManager
+ (id)getAlbumContentFromPageId:(NSInteger)pageId CompletionHandle:(void(^)(LifeBotAlbumModel *model, NSError *error))compeltionHandle;
@end
