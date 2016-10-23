//
//  LifeBigCell.h
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeBigCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UILabel *dateLb;
@property (weak, nonatomic) IBOutlet UILabel *descLb;
@property (weak, nonatomic) IBOutlet UILabel *categoryLb;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLb;
@property (weak, nonatomic) IBOutlet UILabel *starCountLb;

@end
