//
//  LoginView.m
//  BaseProject
//
//  Created by liuping on 2016/10/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LoginView.h"
@interface LoginView ()

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation LoginView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backBtn.hidden = NO;
        self.registerBtn.hidden = NO;
        self.logoImageView.hidden = NO;
        self.emailTF.hidden = NO;
        self.keyTF.hidden = NO;
        self.loginBtn.hidden = NO;
        self.titleLabel.hidden = NO;
        self.peopleBtn.hidden = NO;
        self.QQBtn.hidden = NO;
        self.weiboBtn.hidden = NO;
        self.doubanBtn.hidden = NO;
    }
    return self;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"合作伙伴登录";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_loginBtn);
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(_loginBtn.mas_bottom).mas_equalTo(50);
        }];
    }
    return _titleLabel;
}
- (UIButton *)weiboBtn{
    if (!_weiboBtn) {
        _weiboBtn = [[UIButton alloc] init];
        [self addSubview:_weiboBtn];
        [_weiboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(kWindowW/5);
        }];
        [_weiboBtn setImage:[UIImage imageNamed:@"新浪"] forState:UIControlStateNormal];
    }
    return _weiboBtn;
}

- (UIButton *)peopleBtn{
    if (!_peopleBtn) {
        _peopleBtn = [[UIButton alloc] init];
        [self addSubview:_peopleBtn];
        [_peopleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(kWindowW * 3/8);
        }];

        [_peopleBtn setImage:[UIImage imageNamed:@"人人"] forState:UIControlStateNormal];
    }
    return _peopleBtn;
}

- (UIButton *)doubanBtn{
    if (!_doubanBtn) {
        _doubanBtn = [[UIButton alloc] init];
        [self addSubview:_doubanBtn];
        [_doubanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-kWindowW * 3/8);
        }];

        [_doubanBtn setImage:[UIImage imageNamed:@"豆瓣"] forState:UIControlStateNormal];
    }
    return _doubanBtn;
}

- (UIButton *)QQBtn{
    if (!_QQBtn) {
        _QQBtn = [[UIButton alloc] init];
        [self addSubview:_QQBtn];
        [_QQBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-kWindowW /5);
        }];

        [_QQBtn setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
    }
    return _QQBtn;
}


- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:0];
        [self addSubview:_loginBtn];
        _loginBtn.backgroundColor = [UIColor greenColor];
        _loginBtn.titleLabel.textColor = [UIColor blackColor];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.size.mas_equalTo(_keyTF);
            make.top.mas_equalTo(_keyTF.mas_bottom).mas_equalTo(15);
            [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
        }];
    }
    return _loginBtn;
}

- (UITextField *)emailTF{
    if (!_emailTF) {
        _emailTF = [[HMHTextField alloc]init];
        [self addSubview:_emailTF];
        [_emailTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(_logoImageView.mas_bottom).mas_equalTo(70);
            make.size.mas_equalTo(CGSizeMake(300, 40));
            _emailTF.backgroundColor = [UIColor yellowColor];
            _emailTF.title = @"邮箱";
        }];
    }
    return _emailTF;
}
- (HMHTextField *)keyTF{
    if (!_keyTF) {
        _keyTF = [[HMHTextField alloc]init];
        [self addSubview:_keyTF];
        [_keyTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(_emailTF.mas_bottom).mas_equalTo(15);
            make.size.mas_equalTo(_emailTF);
            _keyTF.backgroundColor = [UIColor yellowColor];
            _keyTF.title = @"密码";
        }];
    }
    return _keyTF;
}
- (UIImageView *)logoImageView{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]init];
        _logoImageView.image = [UIImage imageNamed:@"片刻LOGO"];
        [self addSubview:_logoImageView];
        [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(kWindowH * 2/7);
        }];
    }
    return _logoImageView;
}
-(UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc]init];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setBackgroundColor:[UIColor clearColor]];
        [_registerBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 30));
            make.top.mas_equalTo(40);
            make.right.mas_equalTo(-10);
        }];
        
    }
    return _registerBtn;
}

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]init];
        [_backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [self addSubview:_backBtn];
        [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 40));
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(40);
        }];
        
        
    }
    return _backBtn;
}

@end
