//
//  LifeNetManager.h
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "LifeModel.h"

@interface LifeNetManager : BaseNetManager
+ (id)getDataFromPage:(NSInteger)pageId CompletionHandle:(void(^)(LifeModel *model, NSError *error))completionHandle;
@end
