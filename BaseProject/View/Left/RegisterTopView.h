//
//  RegisterTopView.h
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterTopView : UIView
/** 返回上级页面按钮 */
@property (nonatomic,strong) UIButton *backBtn;
/** 头像 */
@property (nonatomic,strong) UIImageView *iconIV;
/** 性别 */
@property (nonatomic,strong) NSString *gender;
@end
