//
//  TopScrollView.m
//  BaseProject
//
//  Created by liuping on 2016/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopScrollView.h"

@interface TopScrollView ()
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,assign)int currentIndex;
@end

@implementation TopScrollView
- (instancetype)init{
    self = [super init];
    if (self) {
        self.headArray = @[@"最新",@"游记",@"导购",@"评测",@"文化",@"改装",@"行情",@"用车",@"新闻"];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    self.backgroundColor = kRGBColor(240, 215, 215);
    self.contentSize = CGSizeMake(80 * self.headArray.count, 44);
    self.bounces = NO;
    
    [self createBtn];
}

- (void)createBtn{
    for (int i = 0; i < self.headArray.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:0];
        btn.frame = CGRectMake(80 * i, 0, 75, 44);
        [btn setTitle:[self.headArray objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        if (i == 0) {
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
        btn.tag = i + 100;
        [btn addTarget:self action:@selector(didClickHeadBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

- (void)didClickHeadBtnAction:(UIButton *)btn{
    _currentIndex = (int)btn.tag;
    [self changeBtnTitleColorWith:_currentIndex];
    if ([self.seletedDelegate respondsToSelector:@selector(seletedControllerWith:)]) {
        [self.seletedDelegate seletedControllerWith:btn];
    }
}


-(void)changeBtnTitleColorWith:(int)tag{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            if (obj.tag == tag) {
                [obj setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
                if (obj.frame.origin.x >= kWindowW/2 && obj.frame.origin.x <= self.contentSize.width - kWindowW/2) {
                    [UIView animateWithDuration:.5 animations:^{
                        self.contentOffset = CGPointMake(obj.frame.origin.x - kWindowW/2+40, 0);
                        obj.titleLabel.font = [UIFont systemFontOfSize:18];
                    }];
                }
                if (obj.frame.origin.x < kWindowW/2) {
                    [UIView animateWithDuration:.5 animations:^{
                        self.contentOffset = CGPointMake(0, 0);
                        obj.titleLabel.font = [UIFont systemFontOfSize:18];
                    }];
                }
                
            }else{
                [obj setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                obj.titleLabel.font = [UIFont systemFontOfSize:16];
            }
        }
        
    }];
}



@end
