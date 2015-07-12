//
//  GGZoomScrollView.h
//  GGPhotoBrowser
//
//  Created by __无邪_ on 15/7/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GGZoomScrollViewDelegate <NSObject>
@end


@interface GGZoomScrollView : UIScrollView
@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic, strong) id <GGZoomScrollViewDelegate>iDelegate;
- (void)setImage:(UIImage *)image;

- (void)centerScrollViewContents;

- (void)setImage:(UIImage *)image size:(CGSize)size;
- (void)setImageWithUrlStr:(NSString *)imageUrl size:(CGSize)size;


@end
