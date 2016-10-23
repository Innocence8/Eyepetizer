//
//  AlbumBotViewModel.h
//  BaseProject
//
//  Created by liuping on 2016/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface AlbumBotViewModel : BaseViewModel
/** 当前请求页数 */
@property(nonatomic) NSInteger pageId;
/** 行数 */
@property(nonatomic) NSInteger rowNumber;
/** 获取某行的封面图片URL */
- (NSURL *)phototURLForRow:(NSInteger)row;
/** 获取某行内容描述 */
- (NSString *)msgForRow:(NSInteger)row;
/** 获取某行回复数 */
- (NSString *)replyCountForRow:(NSInteger)row;
/** 获取某行点赞数 */
- (NSString *)likeCountForRow:(NSInteger)row;
/** 获取某行创建时间 */
- (NSString *)disabledAtStrForRow:(NSInteger)row;
/** 获取某行收藏数 */
- (NSString *)favoriteCountfoForRow:(NSInteger)row;
/** 获取某张图片高度 */
- (CGFloat)photoHForRow:(NSInteger)row;
/** 获取某张图片宽度 */
- (CGFloat)photoWForRow:(NSInteger)row;
@end
