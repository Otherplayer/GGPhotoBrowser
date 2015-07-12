//
//  ViewController.m
//  GGPhotoBrowser
//
//  Created by __无邪_ on 15/7/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "GGPhotoCell.h"
#import "HYQDynamicModel.h"
#import "GGCollectionViewProtocol.h"


NSString *const Identifier = @"photocellidentifier";

@interface ViewController ()
//<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *photoBrowser;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) GGCollectionViewProtocol *protocol;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.items = [[NSMutableArray alloc] init];
    
//    [self.items addObjectsFromArray:@[@"6.jpg",@"7.jpg",@"10.jpg",@"8.jpg",@"9.jpg",@"12345.png",@"121212.png"]];
    
    
    for (int i = 0; i < 5; i ++) {
        HYQDynamicModel *model = [[HYQDynamicModel alloc] init];
        [model setBasicModelDic:@{kDynamicWidth:@(750),kDynamicHeight:@(442),kDynamicModelImageUrl:@"http://img.hotyq.com/albums/84/105/110584/1475567fae82985c.jpg"}];
        [self.items addObject:model];
    }
    
    
    
    [self.view addSubview:self.photoBrowser];
    
    [self setupPhotoBrowser];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//
//#pragma mark UICollectionViewDataSource
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return self.items.count;
//}
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
//
////#warning
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    GGPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
//    
////    NSString *imageName = [self.items objectAtIndex:indexPath.row];
////    
////    NSLog(@"%@",imageName);
////    [cell setImageWithImageName:imageName];
//    
//    HYQDynamicModel *model = self.items[indexPath.row];
//    
//    [cell configureCellWithModel:model];
//
////    [cell setImageWithImageUrlStr:@"http://img.hotyq.com/albums/84/105/110584/1475567fae82985c.jpg"];
//    
//    return cell;
//}
//
//#pragma mark UICollectionViewDelegateFlowLayout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    CGFloat cellWidth = CGRectGetWidth(self.view.bounds);
//    CGFloat cellHeight = CGRectGetHeight(self.view.bounds);
//    return CGSizeMake(cellWidth, cellHeight);
//}
//
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 0;
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 0;
//}
//
//
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"--%ld",indexPath.row);
}





#pragma mark - Configure


- (void)setupPhotoBrowser{
    UICollectionViewFlowLayout *mainModuleFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [mainModuleFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.photoBrowser = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:mainModuleFlowLayout];
    [self.view addSubview:self.photoBrowser];
    
    GGCollectionViewCellConfigurate configure = ^(GGPhotoCell *cell, NSString *entity, NSIndexPath *indexPath) {
        HYQDynamicModel *model = self.items[indexPath.row];
        [cell configureCellWithModel:model];
    };
    self.protocol = [[GGCollectionViewProtocol alloc] initWithItems:self.items cellIdentifier:Identifier cellConfigureBlock:configure];
    
    
    self.photoBrowser.delegate = self.protocol;
    self.photoBrowser.dataSource = self.protocol;
    
    [self.photoBrowser setDirectionalLockEnabled:YES];
    [self.photoBrowser setPagingEnabled:YES];
    [self.photoBrowser setShowsVerticalScrollIndicator:NO];
    [self.photoBrowser setShowsHorizontalScrollIndicator:NO];
    
    [self.photoBrowser registerClass:[GGPhotoCell class] forCellWithReuseIdentifier:Identifier];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.items.count - 1 inSection:0];
    
    [self.photoBrowser scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}


- (void)scrollViewDidScroll:(nonnull UIScrollView *)scrollView{
    NSLog(@"--");
    
}





@end
