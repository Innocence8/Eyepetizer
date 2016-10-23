//
//  LeftViewController.m
//  TTNews
//
//  Created by liuping on 2016/9/28.
//  Copyright © 2016年 AHJD-12. All rights reserved.
//

#import "LeftViewController.h"
#import "UserCell.h"
#import "OtherCell.h"
#import "LoginViewController.h"
#import "TTTabBarController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation LeftViewController
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 85, 220 , kWindowH * 3/2) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        self.tableView.tableFooterView = [UIView new];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"UserCell" bundle:nil] forCellReuseIdentifier:@"UserCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"OtherCell" bundle:nil] forCellReuseIdentifier:@"OtherCell"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}

#pragma mark - UItableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 150;
    }
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell"];
        cell.backgroundColor = [UIColor clearColor];
        [cell.logBtn addTarget:self action:@selector(gotoLogin) forControlEvents:UIControlEventTouchUpInside] ;
        return cell;
    }else{
        OtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OtherCell"];
        cell.backgroundColor = [UIColor clearColor];
        cell.titleLb.textColor = [UIColor whiteColor];
        if (indexPath.row == 1) {
            cell.titleLb.text = @"首页";
            cell.leftIV.image = [UIImage imageNamed:@"home"];
        }else if (indexPath.row == 2){
            cell.titleLb.text = @"设置";
            cell.leftIV.image = [UIImage imageNamed:@"radio"];
        }else if (indexPath.row == 3){
            cell.titleLb.text = @"发现";
            cell.leftIV.image = [UIImage imageNamed:@"reading"];
        }else if (indexPath.row == 4){
            cell.titleLb.text = @"更新";
            cell.leftIV.image = [UIImage imageNamed:@"peoples"];
        }else{
            cell.titleLb.text = @"联系我们";
            cell.leftIV.image = [UIImage imageNamed:@"snow"];
        }
        return cell;
    }
}
kRemoveCellSeparator

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        [self.sideMenuViewController setContentViewController:[TTTabBarController standardInstance] animated:YES];
        [self.sideMenuViewController hideMenuViewController];
    }else if(indexPath.row == 2){
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
//登陆注册按钮
-(void)gotoLogin{
    LoginViewController *logVC = [[LoginViewController alloc]init];
    [self presentViewController:logVC animated:YES completion:nil];
}

@end
