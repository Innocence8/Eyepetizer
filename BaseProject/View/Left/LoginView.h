//
//  LoginView.h
//  BaseProject
//
//  Created by liuping on 2016/10/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMHTextField.h"

@interface LoginView : UIView
/** 返回上级菜单按钮 */
@property(nonatomic, strong) UIButton *backBtn;
/** 注册按钮 */
@property(nonatomic, strong) UIButton *registerBtn;
/** 图标 */
@property(nonatomic, strong) UIImageView *logoImageView;
/** 邮箱输入文本框 */
@property(nonatomic, strong) HMHTextField *emailTF;
/** 密码输入文本框 */
@property(nonatomic, strong) HMHTextField *keyTF;
/** 确认按钮 */
@property(nonatomic, strong) UIButton *loginBtn;
/** 微博按钮 */
@property(nonatomic, strong) UIButton *weiboBtn;
/** 豆瓣按钮 */
@property(nonatomic, strong) UIButton *doubanBtn;
/** 人人按钮 */
@property(nonatomic, strong) UIButton *peopleBtn;
/** QQ按钮 */
@property(nonatomic, strong) UIButton *QQBtn;
@end
