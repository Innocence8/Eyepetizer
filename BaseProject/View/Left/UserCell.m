//
//  UserCell.m
//  BaseProject
//
//  Created by liuping on 2016/10/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell

- (void)awakeFromNib {
    [super awakeFromNib];

}
- (IBAction)notFound:(id)sender {
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"提示" message:@"此功能尚未开发，敬请期待！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [view show];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
