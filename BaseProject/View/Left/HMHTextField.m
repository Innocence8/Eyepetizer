//
//  HMHTextField.m
//  BaseProject
//
//  Created by liuping on 2016/10/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HMHTextField.h"
@interface HMHTextField ()
@property (nonatomic,strong) UILabel *titleLabel;

@end
@implementation HMHTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubViews];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)setupSubViews
{
    //创建左边的Label
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.frame = CGRectMake(0, 0, 50, 30);
    
    self.titleLabel = label;
    self.leftView = label;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = [NSString stringWithFormat:@"%@:",title];
}

@end
