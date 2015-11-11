//
//  UIView+Add.m
//  faction
//
//  Created by QianFeng on 15/9/9.
//  Copyright (c) 2015年 MaShaoYang. All rights reserved.
//

#import "UIView+Add.h"

@implementation UIView (Add)

-(CGFloat)Width{
    return self.frame.size.width;
}
-(CGFloat)Height{
    return self.frame.size.height;
}
-(CGFloat)Top{
    return self.frame.origin.y;
}
-(CGFloat)Bottom{
    return [self Top] + [self Height];
}
-(CGFloat)Right{
    return [self Left] + [self Width];
}
-(CGFloat)Left{
    return self.frame.origin.x;
}

//设置宽
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

//设置高
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

//设置x
- (void)setXOffset:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

//设置y
- (void)setYOffset:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

//设置Origin
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

//设置size
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
@end
