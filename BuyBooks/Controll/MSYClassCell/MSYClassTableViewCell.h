//
//  MSYClassTableViewCell.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/8.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSYClassTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *money;
@property (strong, nonatomic) IBOutlet UILabel *place;
@property (strong, nonatomic) IBOutlet UILabel *jibie;

@end
