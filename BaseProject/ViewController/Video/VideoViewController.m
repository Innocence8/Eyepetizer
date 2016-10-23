//
//  VideoViewController.m
//  BaseProject
//
//  Created by liuping on 2016/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoCell.h"
#import "VideoViewModel.h"

@interface VideoViewController ()
@property(nonatomic, strong) VideoViewModel *videoVM;
@end

@implementation VideoViewController
- (VideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM = [VideoViewModel new];
    }
    return _videoVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"VideoCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    /** 去掉单元格之间的分割线 */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    /** 刷新操作 */
    [self getRefresh];
}

- (void)getRefresh{
    //头部刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
    //脚部刷新
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - UITableView 注意是Group形式，以section区分
//设置section的头部高度为1像素，高度最小为1
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
//设置section脚部高度为9像素
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 9;
}

//row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = kWindowW * 540.0 / 720;
    return height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.videoVM titleForRow:indexPath.section];
    cell.descLb.text = [self.videoVM descForRow:indexPath.section];
    [cell.iconBtn setBackgroundImageForState:0 withURL:[self.videoVM iconURLForRow:indexPath.section]];
    cell.videoURL=[self.videoVM videoURLForRow:indexPath.section];
    return cell;
}


@end
