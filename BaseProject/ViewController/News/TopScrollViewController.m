//
//  TopScrollViewController.m
//  BaseProject
//
//  Created by liuping on 2016/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopScrollViewController.h"
#import "TopScrollView.h"
#import "NewsViewController.h"

@interface TopScrollViewController ()<UIScrollViewDelegate,seletedControllerDelegate>
@property (nonatomic ,strong) NewsViewController  *newsVC;
@property (nonatomic ,strong) NewsViewController  *firstVC;
@property (nonatomic ,strong) UIScrollView *mainScrollView;
@property (nonatomic ,strong) TopScrollView *topScrollView;
@end

@implementation TopScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 配置顶部滚动视图 */
    [self configTopScrollView];
    
    /** 配置内容滚动视图 */
    self.mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    self.mainScrollView.delegate = self;
    self.mainScrollView.contentSize = CGSizeMake(kWindowW * self.topScrollView.headArray.count, 0);
    self.mainScrollView.pagingEnabled = YES;
    self.mainScrollView.backgroundColor = [UIColor whiteColor];
    self.mainScrollView.showsHorizontalScrollIndicator = NO;
    self.mainScrollView.bounces = NO;
    [self.view addSubview:self.mainScrollView];

    [self changeControllers];
}

/** 配置顶部滚动视图 */
- (void)configTopScrollView{
    self.topScrollView = [TopScrollView new];
    self.topScrollView.seletedDelegate = self;
    self.topScrollView.frame = CGRectMake(0, 20, kWindowW, 44);
    [self.navigationController.navigationBar addSubview:self.topScrollView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    self.topScrollView.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    self.topScrollView.hidden = NO;
}

- (NewsViewController *)latestVCWithType:(NewsListType)type{
    NewsViewController *newsVC = [NewsViewController new];
    newsVC.type = type;
    return newsVC;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){
    [self changeControllers];
    [self.topScrollView changeBtnTitleColorWith:scrollView.contentOffset.x/kWindowW + 100];
}


- (void)seletedControllerWith:(UIButton *)btn{
    [self changeControllers];
    self.mainScrollView.contentOffset = CGPointMake(kWindowW * (btn.tag - 100), -64);
}
/** 切换控制器 */
- (void)changeControllers{
    NSArray *vcs=@[[self latestVCWithType:NewsListTypeZuiXin],
                   [self latestVCWithType:NewsListTypeJiShu],
                   [self latestVCWithType:NewsListTypeYouJi],
                   [self latestVCWithType:NewsListTypeDaoGou],
                   [self latestVCWithType:NewsListTypePingCe],
                   [self latestVCWithType:NewsListTypeWenHua],
                   [self latestVCWithType:NewsListTypeGaiZhuang],
                   [self latestVCWithType:NewsListTypeHangQing],
                   [self latestVCWithType:NewsListTypeYongChe],
                   [self latestVCWithType:NewsListTypeXinWen],
                   ];
    for (int i = 0; i < self.topScrollView.headArray.count ; i ++) {
        self.newsVC = vcs[i];
        self.newsVC.view.frame = CGRectMake(kWindowW * i, 20, kWindowW, kWindowH);
        [self.mainScrollView addSubview:self.newsVC.view];
        [self addChildViewController:self.newsVC];
    }
}

@end
