//
//  RootCollectionReusableView.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootCollectionReusableView : UICollectionReusableView
@property (nonatomic,retain)UILabel * label;
- (void)createView;
@end
