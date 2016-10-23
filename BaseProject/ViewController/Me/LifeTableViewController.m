//
//  MeTableViewController.m
//  BaseProject
//
//  Created by liuping on 2016/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LifeTableViewController.h"
#import "LifeNormalCell.h"
#import "LifeBigCell.h"
#import "LifeTopCell.h"
#import "LifeViewModel.h"
#import "LifeNetManager.h"
#import "ArticStoreContentController.h"
#import "AlbumViewController.h"
#import "AlbumTopViewModel.h"

@interface LifeTableViewController ()
@property(nonatomic, strong) LifeViewModel *lifeVM;
@property(nonatomic, strong) AlbumTopViewModel *albumVM;
@end
#define isArtic [[self.lifeVM CategoryForRow:indexPath.row] isEqualToString:@"文章"]
#define isStore [[self.lifeVM CategoryForRow:indexPath.row] isEqualToString:@"堆糖商店"]
#define isAlbum [[self.lifeVM CategoryForRow:indexPath.row] isEqualToString:@"专辑"]
#define hasDateLb [[self.lifeVM getTimeForRow:indexPath.row] isEqualToString:@"00:00:00"]
#define isBigPic [self.lifeVM isBigPic:indexPath.row]
@implementation LifeTableViewController

- (LifeViewModel *)lifeVM{
    if (!_lifeVM) {
        _lifeVM = [[LifeViewModel alloc]init];
    }
    return _lifeVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 去掉单元格之间的分割线 */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.tableView registerNib:[UINib nibWithNibName:@"LifeNormalCell" bundle:nil] forCellReuseIdentifier:@"LifeNormalCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LifeBigCell" bundle:nil] forCellReuseIdentifier:@"LifeBigCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LifeTopCell" bundle:nil] forCellReuseIdentifier:@"LifeTopCell"];
    [self getrefresh];
}

/** 刷新操作 */
- (void)getrefresh{
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.lifeVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.tableView reloadData];
            }
            [self.tableView.header endRefreshing];
        }];
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.lifeVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.tableView reloadData];
            }
            [self.tableView.footer endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lifeVM.rowNumber;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        LifeTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LifeTopCell"];
        cell.descLb.text = [self.lifeVM descriptionForRow:indexPath.row];
        [cell.iconIv sd_setImageWithURL:[self.lifeVM imageURLForRow:indexPath.row]];
        return cell;
    }else if(hasDateLb && isBigPic){
        LifeBigCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LifeBigCell"];
        [cell.iconIV sd_setImageWithURL:[self.lifeVM imageURLForRow:indexPath.row]];
        cell.dateLb.text = [self.lifeVM dateForRow:indexPath.row];
        cell.nickNameLb.text = [self.lifeVM nicNameForRow:indexPath.row];
        cell.categoryLb.text = [self.lifeVM CategoryForRow:indexPath.row];
        cell.descLb.text = [self.lifeVM descriptionForRow:indexPath.row];
        cell.starCountLb.text = [self.lifeVM dynamicInfo2ForRow:indexPath.row];
        return cell;
    }else{
        LifeNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LifeNormalCell" forIndexPath:indexPath];
        [cell.iconIV sd_setImageWithURL:[self.lifeVM imageURLForRow:indexPath.row]];
        cell.descLabel.text = [self.lifeVM descriptionForRow:indexPath.row];
        cell.nickNameLb.text = [self.lifeVM nicNameForRow:indexPath.row];
        cell.categoryLb.text = [self.lifeVM CategoryForRow:indexPath.row];
        cell.starCountLb.text = [self.lifeVM dynamicInfo2ForRow:indexPath.row];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row  == 0) {
        return 180;
    }else if (hasDateLb && isBigPic){
        return 300;
    }
    return 120;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (isArtic || isStore) {
        ArticStoreContentController *articVC = [[ArticStoreContentController alloc]init];
        articVC.ID = [self.lifeVM getIDForRow:indexPath.row];
        articVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:articVC animated:YES];
        if (isArtic) {
            articVC.path = [NSString stringWithFormat:@"http://www.duitang.com/life_artist/article/?id=%@", articVC.ID];
        }else if (isStore) {
            articVC.path = [self.lifeVM getStorePathForRow:indexPath.row];
        }
    }
//    else if(isAlbum){
//        AlbumViewController *albumVC = [[AlbumViewController alloc]init];
//        albumVC.ID = [self.lifeVM getAlbumIDForRow:indexPath.row];
//        [self.navigationController pushViewController:albumVC animated:YES];
//        albumVC.hidesBottomBarWhenPushed = YES;
//    }
    
}


@end
