//
//  VideoViewModel.h
//  BaseProject
//
//  Created by liuping on 2016/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManager.h"

@interface VideoViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNumber;
@property(nonatomic)NSInteger index;


- (NSString *)titleForRow:(NSInteger)row;

- (NSString *)descForRow:(NSInteger)row;

- (NSURL *)iconURLForRow:(NSInteger)row;

- (NSURL *)videoURLForRow:(NSInteger)row;

@end
