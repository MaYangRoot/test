//
//  UIView+Add.h
//  faction
//
//  Created by QianFeng on 15/9/9.
//  Copyright (c) 2015年 MaShaoYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Add)
-(CGFloat)Width;
-(CGFloat)Height;
-(CGFloat)Top;
-(CGFloat)Bottom;
-(CGFloat)Right;
-(CGFloat)Left;

//设置宽
- (void)setWidth:(CGFloat)width;

//设置高
- (void)setHeight:(CGFloat)height;

//设置x
- (void)setXOffset:(CGFloat)x;

//设置y
- (void)setYOffset:(CGFloat)y;

//设置Origin
- (void)setOrigin:(CGPoint)origin;

//设置size
- (void)setSize:(CGSize)size;
@end
