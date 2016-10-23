//
//  ArticContentController.m
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ArticStoreContentController.h"
#import "LifeViewModel.h"
#import "LifeModel.h"

@interface ArticStoreContentController ()<UIWebViewDelegate>
@property(nonatomic, strong) UIWebView *webview;
@end

@implementation ArticStoreContentController


- (UIWebView *)webview{
    if (!_webview) {
        _webview = [UIWebView new];
        [self.view addSubview:_webview];
        _webview.delegate = self;
        [_webview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [Factory addBackItemToVC:self];
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_path]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //点击webView中的任何一项，跳转到下一页
    //如果当前webView加载的请求不是当前页面的
    if (![request.URL.absoluteString isEqualToString:_path]) {
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
}

@end
