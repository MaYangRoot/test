//
//  RootCollectionViewCellControll.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RootCollectionViewCell;
@interface RootCollectionViewCellControll : NSObject


@property (nonatomic,retain)NSArray * dataSource;

@property (nonatomic,retain)NSArray * dataTitle;


/*
 *实例化成单例，用来个cell进行填充；
 */
+ (RootCollectionViewCellControll *)manager;
/*
 *对cell进行定制
 */
- (RootCollectionViewCell *)customCell:(RootCollectionViewCell *)cell AndIndex:(NSIndexPath *)index;

@end
