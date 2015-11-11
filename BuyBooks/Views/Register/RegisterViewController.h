//
//  RegisterViewController.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BLCOKFILL)(void);
@interface RegisterViewController : UIViewController


@property (nonatomic,copy)BLCOKFILL fill;//用来再跳转到第一页的时候隐藏上导航
-(void)setBlock:(BLCOKFILL)block;

@end
