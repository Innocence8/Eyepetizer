//
//  ScrollViewDisplayViewController.m
//  BaseProject
//
//  Created by AHJD-12 on 16/9/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ScrollDisplayViewController.h"

@interface ScrollDisplayViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@end

@implementation ScrollDisplayViewController

- (instancetype)initWithImgPaths:(NSArray *)paths{
    //路径中可能的类型:NSURL,Http://, https: //, 本地路径：file://
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < paths.count; i ++) {
        id path = paths[i];
        //UIImageView *imageView = [UIImageView new];
        //为了监控用于点击操作，将图片空间转换为Button
        UIButton *btn = [UIButton buttonWithType:0];
        if ([self isURL:path]) {
            [btn sd_setBackgroundImageWithURL:path forState:0];
        }else if ([self isNetPath:path]){
            NSURL *url = [NSURL URLWithString:path];
            //[imageView sd_setImageWithURL:url];
            [btn sd_setBackgroundImageWithURL:url forState:0];
        }else if([path isKindOfClass:[NSString class]]){
            //本地类型
            NSURL *url = [NSURL fileURLWithPath:path];
            //[imageView sd_setImageWithURL:url];
            [btn sd_setBackgroundImageWithURL:url forState:0];
        }else{
            //在这里可以给imageView一张裂开的图片
            //imageView.image = [UIImage imageNamed:@"error@3x"];
            [btn setImage:[UIImage imageNamed:@"error@3x"] forState:0];
        }
        
        UIViewController *vc = [UIViewController new];
        vc.view = btn;
        btn.tag = 1000 + i;
        [btn bk_addEventHandler:^(UIButton *sender) {
            [self.delegate scrollDisplayViewController:self didSelectedIndex:sender.tag-1000];
        } forControlEvents:UIControlEventTouchUpInside];
        
        [arr addObject:vc];
    }
    self = [self initWithControllers:arr];
    return self;
}

//判断传入的路径是否为URL类型
- (BOOL)isURL:(id)path{
    return [path isKindOfClass:[NSURL class]];
}
//是否为网络类型
- (BOOL)isNetPath:(id)path{
    //http://   https://
    BOOL isStr = [path isKindOfClass:[NSString class]];
    //为了防止String类型调用下方方法崩溃
    if (!isStr) {
        return NO;
    }
    BOOL containHttp = [path rangeOfString:@"http"].location != NSNotFound;
    BOOL containTile = [path rangeOfString:@"://"].location != NSNotFound;
    return isStr && containHttp && containTile;
    
    //合写不需要判断
    //return [path isKindOfClass:[NSURL class]] && [path rangeOfString:@"http"].location != NSNotFound && [path rangeOfString:@"://"].location != NSNotFound;
}

//传入图片名字数组
- (instancetype)initWithImgNames:(NSArray *)names{
    //图片名字-->Image-->imageView-->ViewController
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < names.count; i ++) {
        UIImage *img = [UIImage imageNamed:names[i]];
        //UIImageView *iv = [[UIImageView alloc]initWithImage:img];
        UIButton *btn = [UIButton buttonWithType:0];
        [btn setBackgroundImage:img forState:0];
        UIViewController *vc = [UIViewController new];
        vc.view = btn;
        btn.tag = 1000 + i;
        [btn bk_addEventHandler:^(UIButton *sender) {
            [self.delegate scrollDisplayViewController:self didSelectedIndex:sender.tag -1000];
        } forControlEvents:UIControlEventTouchUpInside];
        
        [arr addObject:vc];
    }
    if (self = [self initWithControllers:arr]) {
        
    }
    return self;
}

//传入视图控制器
- (instancetype)initWithControllers:(NSArray *)controllers{
    if (self = [super init]) {
        //为了防止实参是可变数组，需要赋值一份，这样可以保证属性不会因为可变数组在外部被修改而导致自身也被修改
        _controllers = [controllers copy];
        
        _autoCycle = YES;
        _canCycle = YES;
        _showPageControl = YES;
        _duration = 3;
        _pageControlOffset = 0;
    }
    return self;
}

//重写set方法
- (void)setShowPageControl:(BOOL)showPageControl{
    _showPageControl = showPageControl;
    _pageControl.hidden = !showPageControl;
}


- (void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    self.autoCycle = _autoCycle;
}


- (void)setPageControlOffset:(CGFloat)pageControlOffset{
    _pageControlOffset = pageControlOffset;
    //更新页面数量控件 bottom约束
    [_pageControl mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_pageControlOffset);
    }];
}


- (void)setCurrentPage:(NSInteger)currentPage{
    //设置新的显示页面，有3种情况
    //情况1：新页面和老页面是同一个，什么都不用做
    //情况2：新页面在老页面的右侧， 动画效果是向右滚动
    //情况3：新页面在老页面的左侧， 动画效果是向左滚动
    
    //滚动方向枚举值:
    //UIPageViewControllerNavigationDirectionForward, 向左滚动
    //UIPageViewControllerNavigationDirectionReverse, 向右滚动
    NSInteger direction = 0;
    if (_currentPage == currentPage) {
        return;
    }else if (_currentPage > currentPage){
        direction = 1;
    }else{
        direction = 0;
    }
    _currentPage = currentPage;
    UIViewController *vc = _controllers[currentPage];
    [_pageVC setViewControllers:@[vc] direction:direction animated:YES completion:nil];
}

- (void)setAutoCycle:(BOOL)autoCycle{
    _autoCycle = autoCycle;
    [_timer invalidate];
    if (!_autoCycle) {//如果页面在滚动，则不执行下面代码
        return;
    }
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
        //先获取当前页
        UIViewController *vc = _pageVC.viewControllers.firstObject;
        NSInteger index = [_controllers indexOfObject:vc];
        UIViewController *nextVC = nil;
        
        //如果当前页是最后一页，则下一页为第一页
        if (index == _controllers.count - 1) {
            if (!_canCycle) {//如果不能滚动，则不做下面操作
                return ;
            }
            nextVC = _controllers.firstObject;
        }else{
            nextVC = _controllers[index + 1];
        }
        __block ScrollDisplayViewController *vc1 = self;
        [_pageVC setViewControllers:@[nextVC] direction:0 animated:YES completion:^(BOOL finished) {
            //DDLogVerbose：定义输出详细文本
            DDLogVerbose(@"%@", [NSThread currentThread]);
            [vc1 configPageControl];
        }];
        
    } repeats:YES];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //如果控制器数组为空，或者什么都没有
    if (!_controllers || _controllers.count == 0) {
        return;
    }
    
    _pageVC = [[UIPageViewController alloc]initWithTransitionStyle:1 navigationOrientation:0 options:nil];
    _pageVC.delegate = self;
    _pageVC.dataSource = self;
    [self addChildViewController:_pageVC];
    [self.view addSubview:_pageVC.view];
    
    //需要使用pod 引入Masonry 第三方类库
    [_pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    [_pageVC setViewControllers:@[_controllers.firstObject] direction:0 animated:YES completion:nil];
    
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = _controllers.count;
    [self.view addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(0);
    }];
    _pageControl.userInteractionEnabled = NO;
    
    self.autoCycle  =_autoCycle;
    self.showPageControl = _showPageControl;
    self.pageControlOffset = _pageControlOffset;
    
}

//操作原点位置
- (void)configPageControl{
    NSInteger index = [_controllers indexOfObject:_pageVC.viewControllers.firstObject];
    _pageControl.currentPage = index;
}

#pragma mark - UIPageViewController
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (completed && finished) {
        [self configPageControl];
        NSInteger index = [_controllers indexOfObject:pageViewController.viewControllers.firstObject];
        //respondsToSelector 可以判断某个对象是否含有某个方法
        if ([self.delegate respondsToSelector:@selector(scrollDisplayViewController:currentIndex:)]) {
            [self.delegate scrollDisplayViewController:self currentIndex:index];
        }
    }
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index == 0) {//nil代表不能循环
        return _canCycle ? _controllers.lastObject : nil;
    }
    return _controllers[index - 1];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index ==  _controllers.count - 1) {
        return _canCycle ? _controllers.firstObject : nil;
    }
    return  _controllers[index + 1];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
