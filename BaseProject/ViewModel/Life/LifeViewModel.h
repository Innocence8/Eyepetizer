//
//  LifeViewModel.h
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "BaseViewModel.h"
#import "LifeNetManager.h"

@interface LifeViewModel : BaseViewModel
/** 行数 */
@property(nonatomic) NSInteger rowNumber;
/** 当前请求页数 */
@property(nonatomic) NSInteger pageId;
/** 最大页数 */
@property(nonatomic) NSInteger maxPageId;

/** 获取某行的封面图片URL */
- (NSURL *)imageURLForRow:(NSInteger)row;
/** 获取某行内容描述 */
- (NSString *)descriptionForRow:(NSInteger)row;
/** 获取每行分类 */
- (NSString *)CategoryForRow:(NSInteger)row;
/** 获取每行内容类型 */
- (NSString *)contentTypeForRow:(NSInteger)row;
/** 获取某行创建时间 */
- (NSString *)disabledAtStrForRow:(NSInteger)row;
/** 获取某行浏览数 */
- (NSString *)dynamicInfoForRow:(NSInteger)row;
/** 获取某行收藏数 */
- (NSString *)dynamicInfo2ForRow:(NSInteger)row;
/** 获取昵称 */
- (NSString *)nicNameForRow:(NSInteger)row;
/** 获取创建日期 */
- (NSString *)dateForRow:(NSInteger)row;
/** 风格：大图还是小图 */
- (BOOL)isBigPic:(NSInteger)row;
/** 是否有时间标签 */
- (BOOL)hasDateLabel:(NSInteger)row;
/** 是否有竖线分开 */
- (BOOL)hasSeparateView:(NSInteger)row;
/** 获取文章类型target最后的ID */
- (NSString *)getIDForRow:(NSInteger)row;
/** 获取专辑类型target最后的ID */
- (NSString *)getAlbumIDForRow:(NSInteger)row;
/** 获取商店类型的地址 */
- (NSString *)getStorePathForRow:(NSInteger)row;
/** 获取某行创建时间最后的时分秒 */
- (NSString *)getTimeForRow:(NSInteger)row;


@end
