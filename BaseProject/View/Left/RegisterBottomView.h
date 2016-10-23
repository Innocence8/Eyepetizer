//
//  RegisterBottomView.h
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMHTextField.h"

@interface RegisterBottomView : UIView
/** 昵称输入框 */
@property (nonatomic,strong) HMHTextField *nameTF;
/** 邮箱输入框 */
@property (nonatomic,strong) HMHTextField *emailTF;
/** 密码输入框 */
@property (nonatomic,strong) HMHTextField *keyTF;
/** 完成注册按钮 */
@property (nonatomic,strong) UIButton *FinishBtn;
/** 协议按钮 */
@property (nonatomic,strong) UIButton *messageBtn;
@end
