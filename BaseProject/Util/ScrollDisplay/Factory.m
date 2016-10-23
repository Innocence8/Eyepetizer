//
//  Factory.m
//  TTNews
//
//  Created by liuping on 2016/9/28.
//  Copyright © 2016年 AHJD-12. All rights reserved.
//

#import "Factory.h"
#import "UMSocialUIManager.h"
#import <UMSocialCore/UMSocialCore.h>

@implementation Factory
/** 向某个控制器上添加菜单按钮*/
+ (void)addMenuItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_red"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_n"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 10, 25, 25);
    [btn bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    vc.navigationItem.leftBarButtonItems = @[spaceItem, menuItem];
}

/** 向某个控制器上，添加返回按钮 */
+ (void)addBackItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"btn_back_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_back_h"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 45, 44);
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
}

/** 向某个控制器上，添加分享按钮 */
+ (void)addShareItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 45, 44);
    [btn bk_addEventHandler:^(id sender)
     {

         
         [Factory getUserInfoFromWechatWith:vc];
         
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    vc.navigationItem.rightBarButtonItems = @[spaceItem,menuItem];
}
+ (void)shareTextToWechat
{
    NSString *text = @"社会化组件U-Share将各大社交平台接入您的应用，快速武装App。";
    
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    messageObject.text = text;
    
    [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        NSString *message = nil;
        if (!error) {
            message = [NSString stringWithFormat:@"分享成功"];
        } else {
            message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
            
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }];
}

+ (void)getUserInfoFromWechatWith:(UIViewController *)vc
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:vc completion:^(id result, NSError *error)
     {
         
         
         
        UMSocialUserInfoResponse *userinfo =result;
        NSString *message = [NSString stringWithFormat:@"name: %@\n icon: %@\n gender: %@\n",userinfo.name,userinfo.iconurl,userinfo.gender];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UserInfo"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }];
}
@end
