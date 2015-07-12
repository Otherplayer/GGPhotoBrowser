//
//  HYQDynamicModel.h
//  HotYQ
//
//  Created by __无邪_ on 15/7/9.
//  Copyright © 2015年 hotyq. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *const kDynamicModelDateStr;
extern NSString *const kDynamicModelFavourCount;
extern NSString *const kDynamicModelId;
extern NSString *const kDynamicModelImageUrl;
extern NSString *const kDynamicModelFavour;
extern NSString *const kDynamicModelTitle;
extern NSString *const kDynamicModelUid;
extern NSString *const kDynamicBehaviorId;
extern NSString *const kDynamicHeight;
extern NSString *const kDynamicWidth;

typedef NS_ENUM(NSUInteger, HYQIsFavourType) {
    HYQIsFavourType_NO,
    HYQIsFavourType_YES,
    HYQIsFavourType_Unable,//不能用
};

@interface HYQDynamicModel : NSObject
@property (nonatomic, assign)NSTimeInterval dateStr;
@property (nonatomic, assign)NSInteger favourCount;
@property (nonatomic, strong)NSString *imageId;//图片id
@property (nonatomic, strong)NSString *imageUrl;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *uid;//图片所有者id
@property (nonatomic, strong)NSString *behaviorId;//标识id
@property (nonatomic, assign)HYQIsFavourType isFavour;

@property (nonatomic, assign)NSInteger imageHeight;
@property (nonatomic, assign)NSInteger imageWidth;




- (void)setModelWithDic:(NSDictionary *)dic;

- (void)setBasicModelDic:(NSDictionary *)dic;



@end
