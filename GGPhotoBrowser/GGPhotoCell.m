//
//  GGPhotoCell.m
//  GGPhotoBrowser
//
//  Created by __无邪_ on 15/7/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGPhotoCell.h"

@interface GGPhotoCell ()<GGZoomScrollViewDelegate>

@end

@implementation GGPhotoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[GGZoomScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        [self setBackgroundColor:[UIColor blackColor]];
        [self addSubview:self.imageView];
        [self.imageView setIDelegate:self];
        
        
    }
    return self;
}

- (void)configureCellWithModel:(HYQDynamicModel *)model{
    [self.imageView setImageWithUrlStr:model.imageUrl size:CGSizeMake(model.imageWidth, model.imageHeight)];
//    [self.imageView setImage:[UIImage imageNamed:model.imageUrl] size:CGSizeMake(model.imageWidth, model.imageHeight)];
}

@end
