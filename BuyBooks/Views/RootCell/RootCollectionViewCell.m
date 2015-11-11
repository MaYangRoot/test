//
//  RootCollectionViewCell.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "RootCollectionViewCell.h"

@implementation RootCollectionViewCell

- (void)createView{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, self.Width - 10, self.Width - 10)];
    
    [self addSubview:self.imageView];
    
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(0, self.imageView.Bottom + 5, self.imageView.Width, self.Height - self.imageView.Bottom - 5 )];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.font = [UIFont systemFontOfSize:15.f];
    [self addSubview:self.title];
    
}

@end
