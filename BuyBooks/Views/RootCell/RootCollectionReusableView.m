//
//  RootCollectionReusableView.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "RootCollectionReusableView.h"

@implementation RootCollectionReusableView


- (void)createView{
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, ScreenWidth - 10, self.Height)];
    self.label.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.label];
}
@end
