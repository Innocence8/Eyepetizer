//
//  LoginViewController.m
//  BaseProject
//
//  Created by liuping on 2016/10/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisterViewController.h"

@interface LoginViewController ()
@property(nonatomic, strong) LoginView *logView;
@end

@implementation LoginViewController
- (LoginView *)logView{
    if (!_logView) {
        _logView = [[LoginView alloc]init];
        [self.view addSubview:_logView];
        [_logView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _logView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.logView.hidden = NO;
    
    [_logView.registerBtn addTarget:self action:@selector(gotoRegister) forControlEvents:UIControlEventTouchUpInside];
    [_logView.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
/**  返回按钮 */
- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**  注册按钮 */
- (void)gotoRegister{
    RegisterViewController *registView = [[RegisterViewController alloc]init];
    [self presentViewController:registView animated:YES completion:nil];
}

@end
