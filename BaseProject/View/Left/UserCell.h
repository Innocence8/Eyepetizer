//
//  UserCell.h
//  BaseProject
//
//  Created by liuping on 2016/10/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UIButton *logBtn;
@property (weak, nonatomic) IBOutlet UIButton *littleBtn;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
