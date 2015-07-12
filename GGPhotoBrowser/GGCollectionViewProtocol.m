//
//  GGCollectionViewProtocol.m
//  GGPhotoBrowser
//
//  Created by __无邪_ on 15/7/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGCollectionViewProtocol.h"

@interface GGCollectionViewProtocol ()
@property (nonatomic,copy  ) NSString                            *cellIdentifier;
@property (nonatomic,strong) NSArray                             *items;
//Number of sections in table view
@property (nonatomic       ) NSInteger                           sectionNumber;
//Block for cell configuration
@property (nonatomic,copy  ) GGCollectionViewCellConfigurate         cellConfigureBlock;
//Block for number of rows configuration
@property (nonatomic,copy  ) GGCollectionViewNumberOfRowsInSectionConfigurate numberOfRowsConfigure;

@end

@implementation GGCollectionViewProtocol

- (id)init
{
    return nil;
}

-(id)initWithItems:(NSArray *)aItems
    cellIdentifier:(NSString *)aCellIdentifier
  numberOfSections:(NSInteger)aSectionNumber
numberOfRowsInSectionConfigureBlock:(GGCollectionViewNumberOfRowsInSectionConfigurate)aNunberOfRowsInSectionConfigureBlock
cellConfigureBlock:(GGCollectionViewCellConfigurate)aCellConfigureBlock;
{
    self = [super init];
    if (self) {
        self.items = aItems;
        self.cellIdentifier = aCellIdentifier;
        self.sectionNumber = aSectionNumber;
        self.numberOfRowsConfigure = [aNunberOfRowsInSectionConfigureBlock copy];
        self.cellConfigureBlock = [aCellConfigureBlock copy];
    }
    return self;
}

-(id)initWithItems:(NSArray *)aItems
    cellIdentifier:(NSString *)aCellIdentifier
cellConfigureBlock:(GGCollectionViewCellConfigurate)aCellConfigureBlock
{
    return [self initWithItems:aItems
                cellIdentifier:aCellIdentifier
              numberOfSections:1
numberOfRowsInSectionConfigureBlock:nil
            cellConfigureBlock:aCellConfigureBlock];
}








#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.items.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.sectionNumber;
}

//#warning
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id item = self.items[(NSUInteger)indexPath.row];
    self.cellConfigureBlock(cell,item,indexPath);
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGRect mainScreen = [[UIScreen mainScreen] bounds];
    CGFloat cellWidth = CGRectGetWidth(mainScreen);
    CGFloat cellHeight = CGRectGetHeight(mainScreen);
    return CGSizeMake(cellWidth, cellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"--%ld",indexPath.row);
}




















@end
