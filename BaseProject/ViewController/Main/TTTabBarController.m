//
//  TTTabBarController.m
//  TTNews
//
//  Created by liuping on 2016/9/28.
//  Copyright © 2016年 AHJD-12. All rights reserved.
//

#import "TTTabBarController.h"
#import "TTNavigationController.h"
#import "TopScrollViewController.h"
#import "VideoViewController.h"
#import "LifeTableViewController.h"
#import "RankListViewController.h"
#import "Factory.h"

@interface TTTabBarController ()

@end
@implementation TTTabBarController
+ (TTTabBarController *)standardInstance{
    static TTTabBarController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [TTTabBarController new];
    });
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabbar];
}


-(void)initTabbar{
    TopScrollViewController *vc1 = [[TopScrollViewController alloc] init];
    [self addChildViewController:vc1 withImage:[UIImage imageNamed:@"tabbar_news"] selectedImage:[UIImage imageNamed:@"tabbar_news_hl"] withTittle:@"汽车"];
    vc1.tabBarItem.title = @"汽车";
    
    RankListViewController *vc2 = [[RankListViewController alloc] init];
    [self addChildViewController:vc2 withImage:[UIImage imageNamed:@"tabbar_picture"] selectedImage:[UIImage imageNamed:@"tabbar_picture_hl"] withTittle:@"图片"];
    [Factory addMenuItemToVC:vc2];
    [Factory addShareItemToVC:vc2];
    
    VideoViewController *vc3 = [[VideoViewController alloc] init];
    [self addChildViewController:vc3 withImage:[UIImage imageNamed:@"tabbar_video"] selectedImage:[UIImage imageNamed:@"tabbar_video_hl"] withTittle:@"视频"];
    [Factory addMenuItemToVC:vc3];
    
    LifeTableViewController *vc4 = [[LifeTableViewController alloc] init];
    [self addChildViewController:vc4 withImage:[UIImage imageNamed:@"tabbar_setting"] selectedImage:[UIImage imageNamed:@"tabbar_setting_hl"] withTittle:@"生活"];
    [Factory addMenuItemToVC:vc4];
}

- (void)addChildViewController:(UIViewController *)controller withImage:(UIImage *)image selectedImage:(UIImage *)selectImage withTittle:(NSString *)tittle{
    TTNavigationController *nav = [[TTNavigationController alloc] initWithRootViewController:controller];
    
    if ([controller isKindOfClass:[TopScrollViewController class]]) {
        nav.tabBarItem.title = tittle;
        //controller.navigationItem.title = nil;
    }else{
        controller.title = tittle;//这句代码相当于下面两句代码
    }
    [nav.tabBarItem setImage:image];
    [nav.tabBarItem setSelectedImage:selectImage];
//    nav.tabBarItem.title = tittle;
//    controller.navigationItem.title = tittle;

    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    nav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    [self addChildViewController:nav];
}


-(void)didReceiveMemoryWarning {
        
}
@end
