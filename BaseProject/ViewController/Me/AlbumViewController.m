//
//  AlbumTopViewController.m
//  BaseProject
//
//  Created by liuping on 2016/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumViewController.h"
#import "PSCollectionView.h"
#import "AlbumTopViewModel.h"
#import "AlbumTopView.h"
#import "AlbumBotView.h"
#import "AlbumBotViewModel.h"
#import "LifeBotAlbumModel.h"

@interface AlbumViewController ()<UIScrollViewDelegate, PSCollectionViewDelegate, PSCollectionViewDataSource>
@property(nonatomic, strong) PSCollectionView *collectionView;
@property(nonatomic, strong) AlbumTopViewModel *albumTopVM;
@property(nonatomic, strong) AlbumBotViewModel *albumBotVM;

@end

@implementation AlbumViewController
- (AlbumBotViewModel *)albumBotVM{
    if (!_albumBotVM) {
        _albumBotVM = [[AlbumBotViewModel alloc]init];
    }
    return _albumBotVM;
}

- (AlbumTopViewModel *)albumTopVM{
    if (!_albumTopVM) {
        _albumTopVM = [[AlbumTopViewModel alloc]init];
        _albumTopVM.albumID = self.ID.integerValue;
    }
    return _albumTopVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView = [[PSCollectionView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    self.collectionView.delegate = self;
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
    [self.view addSubview:self.collectionView];
    //设置竖向 两行
    self.collectionView.numColsPortrait = 2;
    [self getRefresh];
    
}
-(void)congigTableView{
    AlbumTopView *topView = [[NSBundle mainBundle] loadNibNamed:@"AlbumTopView" owner:nil options:nil].firstObject;
    
    topView.frame = CGRectMake(0, 0, kWindowW, kWindowH *2/7);
    self.collectionView.headerView = topView;
    
    topView.nameLb.text =  [self.albumTopVM getName];
    topView.picCountLb.text =  [self.albumTopVM getPicCount];
    topView.userNameLb.text = [self.albumTopVM getUserName];
    topView.favoriteCountLb.text = [self.albumTopVM getFavoriateCount];
    [topView.avatarIV sd_setImageWithURL:[NSURL URLWithString:[self.albumTopVM getAvatarURL]]];
}

- (void)getRefresh{
//顶部视图获取数据
    [self.albumTopVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self congigTableView];
        [self.collectionView reloadData];
        if (error) {
            [self showErrorMsg:error.localizedDescription];
        }
    }];
//头部刷新
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.albumBotVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.collectionView reloadData];
            }
            [self.collectionView.header endRefreshing];
            
        }];
    }];
//尾部刷新
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.albumBotVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.collectionView reloadData];
            }
            [self.collectionView.footer endRefreshing];
        }];
    }];
    [self.collectionView.header beginRefreshing];
    
}

#pragma mark - PSCollectionView
#pragma mark - 返回有多少行
- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView{
    NSLog(@"===========================%ld", self.albumBotVM.rowNumber);
    return self.albumBotVM.rowNumber;
}
#pragma mark - 返回每行的高度
- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index{
    return [self.albumBotVM photoHForRow:index + 40];
}
#pragma mark - 每个cell的内容
- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index{
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    if (!cell) {
        cell = [[PSCollectionViewCell alloc]initWithFrame:CGRectZero];
        cell.backgroundColor = [UIColor greenColor];
        UIView *view = [UIView new];
        [cell addSubview:view];
        view.tag = 100;
        
        UIImageView *imageView = [[UIImageView alloc]init];
        [view addSubview:imageView];
        imageView.tag = 200;
        
        AlbumBotView *botView = [[NSBundle mainBundle]loadNibNamed:@"AlbumBotView" owner:nil options:nil].firstObject;
        botView.tag = 300;
        [view addSubview:botView];
        
    }
    UIView *view = (UIView *)[cell viewWithTag:100];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:200];
    [imageView sd_setImageWithURL:[self.albumBotVM phototURLForRow:index]];
    
    AlbumBotView *botView = (AlbumBotView *)[cell viewWithTag:300];
    botView.msgLb.text = [self.albumBotVM msgForRow:index];
    botView.replyLb.text = [self.albumBotVM replyCountForRow:index];
    botView.favoriteLb.text = [self.albumBotVM favoriteCountfoForRow:index];
    botView.likeLb.text = [self.albumBotVM likeCountForRow:index];
    
    view.frame = CGRectMake(0, 0, (kWindowW - 30)/2, [self collectionView:collectionView heightForRowAtIndex:index]);
    imageView.frame = CGRectMake(0, 0, 172.5, [self.albumBotVM photoWForRow:index]);
    botView.frame = CGRectMake(0, [self.albumBotVM photoHForRow:index], 172.5, [self.albumBotVM photoHForRow:index]);
   
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
