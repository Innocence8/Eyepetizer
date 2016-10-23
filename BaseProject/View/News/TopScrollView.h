//
//  TopScrollView.h
//  BaseProject
//
//  Created by liuping on 2016/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol seletedControllerDelegate <NSObject>

-(void)seletedControllerWith:(UIButton *)btn;

@end


@interface TopScrollView : UIScrollView
@property (nonatomic ,strong)NSArray *headArray;
@property (nonatomic ,weak)id<seletedControllerDelegate> seletedDelegate;
-(void)changeBtnTitleColorWith:(int)tag;
@end
