//
//  GGZoomScrollView.m
//  GGPhotoBrowser
//
//  Created by __无邪_ on 15/7/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGZoomScrollView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface GGZoomScrollView ()<UIScrollViewDelegate>{
    //缩放前大小
    CGSize initSize;
}
@end

@implementation GGZoomScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];

        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.userInteractionEnabled = YES;
        self.clipsToBounds = YES;
        self.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        self.delegate = self;
        self.minimumZoomScale = 1;
        self.maximumZoomScale = 1.5;
        self.zoomScale = 1;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)setImageView:(UIImageView *)imageView {
    _imageView = imageView;
    [self centerScrollViewContents];
}

- (void)setImage:(UIImage *)image size:(CGSize)size{
    
    [self.imageView setImage:image];
    
    
    self.zoomScale = 1.0;
    
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat ratt = width / size.width;
    CGFloat heigth = ratt * size.height;
    
    initSize = CGSizeMake(width, heigth);
    
    
    [self.imageView setFrame:CGRectMake(0, (CGRectGetHeight(self.bounds) - heigth ) / 2, width ,heigth)];
    
    
}

- (void)setImageWithUrlStr:(NSString *)imageUrl size:(CGSize)size{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"6.jpg"]];
    
    
    self.zoomScale = 1.0;
    
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat ratt = width / size.width;
    CGFloat heigth = ratt * size.height;
    
    initSize = CGSizeMake(width, heigth);
    
    
    [self.imageView setFrame:CGRectMake(0, (CGRectGetHeight(self.bounds) - heigth ) / 2, width ,heigth)];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.imageView addGestureRecognizer:tapGesture];
}


- (void)setImage:(UIImage *)image{
    [self.imageView setImage:image];
    

    CGFloat width = CGRectGetWidth(self.bounds);
    
    CGFloat ratt = width / 750;
    
    CGFloat heigth = ratt * 442;
    
    self.zoomScale = 1.0;
    
    [self.imageView setFrame:CGRectMake(0, (CGRectGetHeight(self.bounds) - heigth ) / 2, width ,heigth)];
    
}

#pragma mark -

- (void)centerScrollViewContents {
    CGSize boundsSize = self.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageView.frame = contentsFrame;
}

#pragma mark - Delegate


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    // The scroll view has zoomed, so you need to re-center the contents
    [self centerScrollViewContents];

    CGFloat rat = self.zoomScale;
    CGFloat width = initSize.width;
    CGFloat heigth = initSize.height;
    CGRect newRect = CGRectMake(0, (CGRectGetHeight(self.bounds) - heigth - 64) / 2, width * rat, heigth * rat);
    self.imageView.frame = newRect;
}


#pragma mark - Action

- (void)tapAction:(id)sender{
    NSLog(@"--");
}




@end
