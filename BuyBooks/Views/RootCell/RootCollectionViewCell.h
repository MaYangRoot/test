//
//  RootCollectionViewCell.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic)  UIImageView *imageView;

@property (strong, nonatomic)  UILabel *title;


- (void)createView;
@end
