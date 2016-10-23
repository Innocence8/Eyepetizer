//
//  RegisterBottomView.m
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RegisterBottomView.h"
@interface RegisterBottomView ()

/**
 *  提示信息
 */
@property (nonatomic,strong) UILabel *messageLabel;

@end

@implementation RegisterBottomView
#pragma mark -
#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.nameTF];
        [self addSubview:self.emailTF];
        [self addSubview:self.keyTF];
        [self addSubview:self.FinishBtn];
        [self addSubview:self.messageLabel];
        [self addSubview:self.messageBtn];
        
        //设置子控件的自动适配
        [self setupAutoLayout];
    }
    return self;
}
#pragma mark -
#pragma mark - 自动适配
- (void)setupAutoLayout
{
    __weak typeof(self)vc = self;
    
    //昵称输入框约束
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.mas_top).offset(kWindowH * 0.08);
        make.centerX.equalTo(vc.mas_centerX);
        make.left.equalTo(vc.mas_left).offset(30);
        make.height.mas_equalTo(kWindowH * 0.06);
    }];
    
    //邮箱输入框约束
    [_emailTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.nameTF.mas_bottom).offset(15);
        make.centerX.equalTo(vc.mas_centerX);
        make.left.equalTo(vc.nameTF.mas_left);
        make.height.equalTo(vc.nameTF.mas_height);
    }];
    
    //密码输入框约束
    [_keyTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.emailTF.mas_bottom).offset(15);
        make.centerX.equalTo(vc.mas_centerX);
        make.left.equalTo(vc.nameTF.mas_left);
        make.height.mas_equalTo(vc.nameTF.mas_height);
    }];
    
    //登录按钮约束
    [_FinishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.keyTF.mas_bottom).offset(30);
        make.centerX.equalTo(vc.mas_centerX);
        make.left.equalTo(vc.keyTF.mas_left);
        make.height.mas_equalTo(kWindowH * 0.06);
    }];
    
    //提示信息
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.FinishBtn.mas_bottom).offset(50);
        make.left.equalTo(vc.FinishBtn.mas_left).offset(10);
        make.right.equalTo(vc.messageBtn.mas_left);
        make.height.mas_equalTo(20);
    }];
    
    //片刻协议按钮
    [_messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(vc.messageLabel.mas_centerY);
        make.height.equalTo(vc.messageLabel.mas_height);
        make.left.equalTo(vc.messageLabel.mas_right);
        make.right.equalTo(vc.FinishBtn.mas_right).offset(-10);
    }];
    
}

#pragma mark -
#pragma mark - 懒加载
- (HMHTextField *)nameTF{
    if (!_nameTF) {
        _nameTF = [[HMHTextField alloc] init];
        _nameTF.backgroundColor = [UIColor yellowColor];
        _nameTF.title = @"昵称";
    }
    return _nameTF;
}
- (HMHTextField *)emailTF{
    if (!_emailTF) {
        _emailTF = [[HMHTextField alloc] init];
        _emailTF.backgroundColor = [UIColor yellowColor];
        _emailTF.title = @"邮箱";
    }
    return _emailTF;
}
- (HMHTextField *)keyTF{
    if (!_keyTF) {
        _keyTF = [[HMHTextField alloc] init];
        _keyTF.backgroundColor = [UIColor yellowColor];
        _keyTF.title = @"密码";
        _keyTF.secureTextEntry = YES;
    }
    return _keyTF;
}
- (UIButton *)FinishBtn{
    if (!_FinishBtn) {
        _FinishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_FinishBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_FinishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_FinishBtn setBackgroundColor:[UIColor greenColor]];
    }
    return _FinishBtn;
}
- (UIButton *)messageBtn{
    if (!_messageBtn) {
        _messageBtn = [[UIButton alloc] init];
        [_messageBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_messageBtn setTitle:@"协议" forState:UIControlStateNormal];
        [_messageBtn setBackgroundColor:[UIColor yellowColor]];
        _messageBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _messageBtn;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.text = @"点击'完成'按钮，代表你已阅读并同意";
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.font = [UIFont systemFontOfSize:12];
        _messageLabel.textColor = [UIColor blackColor];
        _messageLabel.backgroundColor = [UIColor whiteColor];
    }
    return _messageLabel;
}

@end
