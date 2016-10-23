//
//  BaseNetManager.h
//  BaseProject
//
//  Created by liuping on 2016/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//


#import "BaseNetManager.h"
#import "VideoModel.h"

@interface VideoNetManager : BaseNetManager

//http://c.m.163.com/nc/video/home/0-10.html
+ (id)getVideoWithIndex:(NSInteger)index kCompletionHandle;

@end
