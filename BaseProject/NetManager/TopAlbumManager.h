//
//  LifeAlbumManager.h
//  BaseProject
//
//  Created by liuping on 2016/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "LifeTopAlbumModel.h"

@interface TopAlbumManager : BaseNetManager
+ (id)getAlbumTypeFromPageId:(NSInteger)pageId CompletionHandle:(void(^)(LifeTopAlbumModel *model, NSError *error))completionHandle;
@end
