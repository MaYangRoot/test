//
//  ViewFactory.m
//  Fcatory
//
//  Created by QianFeng on 15/9/13.
//  Copyright (c) 2015年 MaShaoYang. All rights reserved.
//

#import "ViewFactory.h"

@implementation ViewFactory
+ (UIView *)createViewMasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius BackGroundColor:(UIColor *)backgroundColor Frame:(CGRect)frame Tag:(NSUInteger)tag{
    
    UIView * view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    view.tag = tag;
    view.layer.masksToBounds = MTB;
    if (MTB) {
        view.layer.cornerRadius = cornerRadius;
    }
    return view;
}
+ (UIView *)createViewBackGroundColor:(UIColor *)backgroundColor Frame:(CGRect)frame Tag:(NSUInteger)tag{
    
    return [self createViewMasksToBounds:NO CornerRadius:0 BackGroundColor:backgroundColor Frame:frame Tag:tag];
}
@end
