//
//  BaseViewController.h
//  TEST
//
//  Created by QianFeng on 15/9/9.
//  Copyright (c) 2015年 MaShaoYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
- (void)initData;
- (void)createView;
- (void)addTouchAction;
- (void)backAction;
- (void)ButtonDidCliked:(UIButton *)button;
@end
