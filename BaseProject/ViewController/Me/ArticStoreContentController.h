//
//  ArticContentController.h
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticStoreContentController : UIViewController
/** 用于接收传过来的商店或者文章的路径 */
@property(nonatomic, strong) NSString *path;
/** 用于接收target后面的id */
@property(nonatomic, strong) NSString *ID;
@end
