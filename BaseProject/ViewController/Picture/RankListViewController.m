//
//  RankListViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "XiMaCategoryCell.h"
#import "XiMaCategoryViewModel.h"
#import "MusicListViewController.h"
#import <UMSocialCore/UMSocialCore.h>

@interface RankListViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) XiMaCategoryViewModel *ximaVM;
@end
@implementation RankListViewController

-(void)authWithPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager]  authWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
        [self.tableView reloadData];
        UMSocialAuthResponse *authresponse = result;
        NSString *message = [NSString stringWithFormat:@"result: %d\n uid: %@\n accessToken: %@\n",(int)error.code,authresponse.uid,authresponse.accessToken];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }];
}

- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
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

- (XiMaCategoryViewModel *)ximaVM{
    if (!_ximaVM) {
        _ximaVM = [XiMaCategoryViewModel new];
    }
    return _ximaVM;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWindowH, kWindowW) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
/*啊坤诚呐 同学说了 行高一样用rowheight 不然影响效率啊
    所以这里删除了返回高度的协议方法，改为rowHeight
 */
        _tableView.rowHeight = 75;
        _tableView.estimatedRowHeight = 75;
        
        [_tableView registerClass:[XiMaCategoryCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.ximaVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error];
                }else{
                    [self.tableView reloadData];
                    //   重置脚步 没有更多数据
                    [_tableView.footer resetNoMoreData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        self.tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.ximaVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [self.tableView reloadData];
                    if ([self.ximaVM isHasMore]) {
                        [_tableView.footer endRefreshing];
                    }else{
                        [_tableView.footer endRefreshingWithNoMoreData];
                    }
                }
            }];
        }];
    }
    return _tableView;
}

+ (UINavigationController *)defaultNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RankListViewController *vc = [RankListViewController new];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [Factory addMenuItemToVC:self];
    self.title = @"音乐";
    [self.tableView.header beginRefreshing];
    
    /** 去掉单元格之间的分割线 */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ximaVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XiMaCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.ximaVM titleForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.ximaVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.orderLb.text = @(indexPath.row + 1).stringValue;
    cell.descLb.text = [self.ximaVM descForRow:indexPath.row];
    cell.numberLb.text = [self.ximaVM numberForRow:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MusicListViewController *vc =[[MusicListViewController alloc] initWithAlbumId:[self.ximaVM albumIdForRow:indexPath.row]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
