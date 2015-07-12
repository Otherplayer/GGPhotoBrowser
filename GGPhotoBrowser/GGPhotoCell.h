//
//  GGPhotoCell.h
//  GGPhotoBrowser
//
//  Created by __无邪_ on 15/7/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGZoomScrollView.h"
#import "HYQDynamicModel.h"

@interface GGPhotoCell : UICollectionViewCell
@property (nonatomic, strong) GGZoomScrollView *imageView;


- (void)configureCellWithModel:(HYQDynamicModel *)model;

@end
