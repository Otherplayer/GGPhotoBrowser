//
//  HYQDynamicModel.m
//  HotYQ
//
//  Created by __无邪_ on 15/7/9.
//  Copyright © 2015年 hotyq. All rights reserved.
//

#import "HYQDynamicModel.h"


NSString *const kDynamicModelDateStr = @"dateStr";
NSString *const kDynamicModelFavourCount = @"favour_count";
NSString *const kDynamicModelId = @"id";
NSString *const kDynamicModelImageUrl = @"image_url";
NSString *const kDynamicModelFavour = @"isFavour";
NSString *const kDynamicModelTitle = @"title";
NSString *const kDynamicModelUid = @"uid";
NSString *const kDynamicBehaviorId = @"favour_behavior_id";
NSString *const kDynamicHeight = @"image_high";
NSString *const kDynamicWidth = @"image_width";

@implementation HYQDynamicModel

- (void)setModelWithDic:(NSDictionary *)dic{
    self.dateStr = [dic[kDynamicModelDateStr] doubleValue];
    self.favourCount = [dic[kDynamicModelFavourCount] integerValue];
    self.imageId = dic[kDynamicModelId];
    self.title = dic[kDynamicModelTitle];
    self.uid = dic[kDynamicModelUid];
    self.isFavour = [dic[kDynamicModelFavour] intValue];
    self.imageUrl = dic[kDynamicModelImageUrl];
    self.behaviorId = [NSString stringWithFormat:@"%@",dic[kDynamicBehaviorId]];
    
    self.imageWidth = [dic[kDynamicWidth] integerValue];
    self.imageHeight = [dic[kDynamicHeight] integerValue];
    
}


@end
