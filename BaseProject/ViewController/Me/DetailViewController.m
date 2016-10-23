//
//  DetailViewController.m
//  BaseProject
//
//  Created by liuping on 2016/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property(nonatomic,strong) NSNumber *ID;
@end

@implementation DetailViewController
-(id)initWithID:(NSNumber *)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    UIWebView *webView=[UIWebView new];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    NSString *path=[NSString stringWithFormat:@"http://cont.app.autohome.com.cn/autov5.0.0/content/news/newscontent-n%@-t0-rct1.json", _ID];
    NSURL *url=[NSURL URLWithString:path];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
