//
//  VideoCell.h
//  BaseProject
//
//  Created by liuping on 2016/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *descLb;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property(nonatomic, strong)NSURL *videoURL;

@end
