//
//  LoginViewController.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 *用户登陆页
 */
typedef void(^BLCOKHIDD)(void);

@interface LoginViewController : UIViewController

@property (nonatomic,copy)BLCOKHIDD hidd;//用来再跳转到第一页的时候隐藏上导航

-(void)setBlock:(BLCOKHIDD)block;

@end
