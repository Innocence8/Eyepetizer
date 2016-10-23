//
//  NewsModel.h
//  BaseProject
//
//  Created by AHJD-12 on 16/9/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NewsResultModel,NewsResultHeadlineinfoModel, NewsResultHeadTopnewsinfoModel;

@interface NewsModel : BaseModel

@property(nonatomic,strong) NSString *message;
@property(nonatomic,strong) NSNumber *returncode;
@property(nonatomic,strong) NewsResultModel *result;

@end

@interface NewsResultModel :BaseModel
@property(nonatomic,strong) NSArray *focusimg;
@property(nonatomic,strong) NewsResultHeadlineinfoModel *headlineinfo;
@property(nonatomic,strong) NSNumber *isloadmore;
@property(nonatomic,strong) NSArray *anewslist;
@property(nonatomic,strong) NSNumber *rowcount;
@property(nonatomic,strong) NewsResultHeadTopnewsinfoModel *topnewsinfo;

@end
/*
 "id": 880324,
 "imgurl": "http://www0.autoimg.cn/zx/newspic/2015/10/22/640x320_0_2015102206345716003.jpg",
 "JumpType": 0,
 "jumpurl": "",
 "mediatype": 1,
 "pageindex": 1,
 "replycount": 0,
 "title": "省钱还不憋屈 购置税减半合资SUV推荐",
 "type": "选车导购",
 "updatetime": "20151022073656"
 */
@interface NewsResultFocusimgModel : BaseModel
@property(nonatomic,strong) NSNumber *ID;
@property(nonatomic,strong) NSString *imgurl;
@property(nonatomic,strong) NSNumber *JumpType;
@property(nonatomic,strong) NSString *jumpurl;
@property(nonatomic,strong) NSNumber *mediatype;
@property(nonatomic,strong) NSNumber *pageindex;
@property(nonatomic,strong) NSNumber *replycount;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *updatetime;

@end
/*
 "id": 880585,
 "indexdetail": "",
 "jumppage": 1,
 "lasttime": "",
 "mediatype": 1,
 "pagecount": 0,
 "replycount": 1033,
 "smallpic": "http://www0.autoimg.cn/zx/newspic/2015/10/21/160x120_0_2015102116263065603.jpg",
 "time": "2015-10-22",
 "title": "信誉严重受损 大众“排放门”事件始末",
 "type": "新闻中心",
 "updatetime": "20151022104657"
 */
@interface NewsResultHeadlineinfoModel : BaseModel
@property(nonatomic,strong) NSString *updatetime;
@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *time;
@property(nonatomic,strong) NSString *smallpic;
@property(nonatomic,strong) NSNumber *replycount;
@property(nonatomic,strong) NSNumber *pagecount;
@property(nonatomic,strong) NSNumber *mediatype;
@property(nonatomic,strong) NSString *lasttime;
@property(nonatomic,strong) NSNumber *jumppage;
@property(nonatomic,strong) NSString *indexdetail;
@property(nonatomic,strong) NSNumber *ID;
@end

@interface NewsResultNewslistModel : NewsResultHeadlineinfoModel
//变量的名字 不能以new开头
@property(nonatomic,strong) NSNumber *anewstype;
@property(nonatomic,strong) NSNumber *dbid;
@property(nonatomic,strong) NSString *intacttime;

@end

@interface NewsResultHeadTopnewsinfoModel : BaseModel

@end

