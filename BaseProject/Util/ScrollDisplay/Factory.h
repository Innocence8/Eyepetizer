//
//  Factory.h
//  TTNews
//
//  Created by liuping on 2016/9/28.
//  Copyright © 2016年 AHJD-12. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
/** 向某个控制器上添加菜单按钮*/
+ (void)addMenuItemToVC:(UIViewController *)vc;

/** 向某个控制器上，添加返回按钮 */
+ (void)addBackItemToVC:(UIViewController *)vc;

/** 向某个控制器上，添加分享按钮 */
+ (void)addShareItemToVC:(UIViewController *)vc;

@end
