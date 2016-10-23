//
//  NewsViewController.m
//  BaseProject
//
//  Created by liuping on 2016/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NewsViewController.h"
#import "LatestCell.h"
#import "LatestViewModel.h"
#import "DetailViewController.h"
#import "TopScrollView.h"
#import "TopScrollViewController.h"

@interface NewsViewController ()<ScrollDisplayViewControllerDelegate>
@property (nonatomic ,strong) NewsViewController  *newsVC;
@property (nonatomic ,strong) TopScrollView *topView;
@property(nonatomic, strong) LatestViewModel *latestVM;
@property(nonatomic,strong) ScrollDisplayViewController *sdVC;
@end

@implementation NewsViewController


- (LatestViewModel *)latestVM{
    if (!_latestVM) {
        _latestVM = [[LatestViewModel alloc]initWithNewsListType:_type];
    }
    return _latestVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"LatestCell" bundle:nil] forCellReuseIdentifier:@"LatestCell"];
    /** 刷新数据 */
    [self getRefresh];
    /** 去掉单元格之间的分割线 */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


/** 刷新数据 */
- (void)getRefresh{
    //头部刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.latestVM refreshDataCompleteHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }
            [self configTableHeader];
        }];
    }];
    
    //尾部加载更多
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.latestVM getMoreDataCompleteHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.description];
            }
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
    
}
/** 配置上方滚动视图 */
- (void)configTableHeader{
    if (self.latestVM.headImageURLs.count == 0) {
        return;
    }
    UIView *headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 185)];
    //把之前的child移除，再新建
    [_sdVC removeFromParentViewController];
    _sdVC = [[ScrollDisplayViewController alloc] initWithImgPaths:self.latestVM.headImageURLs];
    _sdVC.delegate = self;
    [self addChildViewController:_sdVC];
    [headerView addSubview:_sdVC.view];
    [_sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(headerView);
    }];
    self.tableView.tableHeaderView = headerView;
}


#pragma mark - ScrollDisplayViewControllerDelegate
- (void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController didSelectedIndex:(NSInteger)index{
    DDLogVerbose(@"%ld", index);
}

#pragma mark - Table view data source

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.latestVM.rowNumber;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *vc=[[DetailViewController alloc] initWithID:[self.latestVM IDForRow:indexPath.row]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LatestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LatestCell"];
    //网络加载用的是AF的，据说SDWeb比AF快0.03秒
    [cell.iconIV setImageWithURL:[self.latestVM iconURLForRow:indexPath.row]];
    cell.titleLb.text = [self.latestVM titleForRow:indexPath.row];
    cell.dateLb.text = [self.latestVM dateForRow:indexPath.row];
    cell.commentLb.text = [self.latestVM commentNumberForRow:indexPath.row];
    return cell;
    
}


@end
