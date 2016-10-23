//
//  LifeModel.h
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class LifeDataObjectListColumnModel,LifeDataModel;

@interface LifeModel : BaseModel
@property (nonatomic, assign) double status;
@property (nonatomic) LifeDataModel *data;
@end

@interface LifeDataModel : BaseModel
@property (nonatomic, strong) NSArray *objectList;
@property (nonatomic, assign) double nextStart;
@property (nonatomic, assign) double more;
@end

@interface LifeDataObjectListModel : BaseModel
@property (nonatomic, strong) LifeDataObjectListColumnModel *column;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *style;
@property (nonatomic, strong) NSString *dynamicInfo2;
@property (nonatomic, strong) NSString *target;
@property (nonatomic, strong) NSString *dynamicInfo;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *enabledAtStr;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) double enabledAt;
@property (nonatomic, assign) double disabledAt;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *disabledAtStr;
@property (nonatomic, strong) NSString *iconUrl2;
@property (nonatomic, strong) NSString *contentType;
@property (nonatomic, strong) NSString *contentCategory;
@property (nonatomic, strong) NSString *tagTitle;
@property (nonatomic, strong) NSString *stitle;
@property (nonatomic, strong) NSString *extInfo;
@property (nonatomic, strong) NSString *desc;
@end

@interface LifeDataObjectListColumnModel : BaseModel
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *columnIdentifier;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *target;
@property (nonatomic, assign) double subCount;
@end




