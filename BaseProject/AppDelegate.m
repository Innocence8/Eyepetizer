//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"
#import "TTTabBarController.h"
#import "RankListViewController.h"
#import "LifeModel.h"
#import <UMSocialCore/UMSocialCore.h>

@interface AppDelegate ()

@end
//友盟统计中的
#define APPKey @"57e0f5e9e0f55aeab50028a9"
//AppKey:58089be41061d273b6000dd9

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window.rootViewController = self.sideMenu;
    [NSThread sleepForTimeInterval:2.0];
    
    //打开调试日志
    [[UMSocialManager defaultManager] openLog:YES];
    
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"57b432afe0f55a9832001a0a"];
    
    // 获取友盟social版本号
    //NSLog(@"UMeng social version: %@", [UMSocialGlobal umSocialSDKVersion]);
    
    //设置微信的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx945b58aef3a271f0" appSecret:@"0ae78dd42761fd9681b04833c79a857b" redirectURL:@"http://mobile.umeng.com/social"];
    
    return YES;
}

/** 代码重构:用代码把功能实现以后，考虑代码结构如何编写可以更加方便后期维护 */
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[TTTabBarController new] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为sideMenu设置背景图,图片插件KSImageName，到Github下载
        _sideMenu.backgroundImage = [UIImage imageNamed:@"leftPic.jpg"];
        //可以让出现菜单时不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden = YES;
        //不允许菜单栏到了边缘还可以继续缩小
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}

@end
