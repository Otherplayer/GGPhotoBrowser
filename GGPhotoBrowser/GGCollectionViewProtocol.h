//
//  GGCollectionViewProtocol.h
//  GGPhotoBrowser
//
//  Created by __无邪_ on 15/7/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^GGCollectionViewCellConfigurate)(id cell, id entity, NSIndexPath *indexPath);

/**
 *  配置不同section中的cell的行数(rows)
 *
 *  @param section section下标
 *
 *  @return GGCollectionView中section的数量
 */
typedef NSInteger (^GGCollectionViewNumberOfRowsInSectionConfigurate) (NSInteger section);

@interface GGCollectionViewProtocol : NSObject<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>



-(id)initWithItems:(NSArray *)aItems
    cellIdentifier:(NSString *)aCellIdentifier
  numberOfSections:(NSInteger)aSectionNumber
numberOfRowsInSectionConfigureBlock:(GGCollectionViewNumberOfRowsInSectionConfigurate)aNunberOfRowsInSectionConfigureBlock
cellConfigureBlock:(GGCollectionViewCellConfigurate)aCellConfigureBlock;

/**
 *  协议构造器2：默认只有一个section时使用
 *
 *  @param aItems
 *  @param aCellIdentifier
 *  @param aCellConfigureBlock
 *
 *  @return Protocal Object
 */
-(id)initWithItems:(NSArray *)aItems
    cellIdentifier:(NSString *)aCellIdentifier
cellConfigureBlock:(GGCollectionViewCellConfigurate)aCellConfigureBlock;
@end
