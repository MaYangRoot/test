//
//  LabelFactory.m
//  faction
//
//  Created by QianFeng on 15/9/9.
//  Copyright (c) 2015年 MaShaoYang. All rights reserved.
//

#import "LabelFactory.h"
#import <UIKit/UIKit.h>
@implementation LabelFactory

+(UILabel *)CreateLabelFontSize:(CGFloat)size BorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth TitleColor:(UIColor *)titleColor BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius TextAlignment:(NSTextAlignment)textAlignment Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag{
    
    UILabel * label = [[UILabel alloc]init];
    //字体大小（样式：系统默认）
    label.font = [UIFont systemFontOfSize:size];
    //设置边框宽度，颜色
    label.layer.borderColor = borderColor.CGColor;
    label.layer.borderWidth = borderWidth;
    //字体颜色
    label.textColor = titleColor;
    //背景颜色
    label.backgroundColor = backgroundColor;
    //圆角
    if (MTB) {
        label.layer.masksToBounds = MTB;
        label.layer.cornerRadius = cornerRadius;
    }
    //位置_居中~~
    label.textAlignment = textAlignment;
    //标签
    label.text = title;
    //frame
    label.frame = frame;
    //tag
    label.tag = tag;
    
    return label ;
    
}


+(UILabel *)CreateLabelBorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth TitleColor:(UIColor *)titleColor BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius TextAlignment:(NSTextAlignment)textAlignment Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag{
    
    
    return [self CreateLabelFontSize:14.f BorderColor:borderColor BorderWidth:borderWidth TitleColor:titleColor BackgroundColor:backgroundColor MasksToBounds:MTB CornerRadius:cornerRadius TextAlignment:textAlignment Title:title Frame:frame Tag:tag];
    
}

+(UILabel *)CreateLabelTitleColor:(UIColor *)titleColor BackgroundColor:(UIColor *)backgroundColor TextAlignment:(NSTextAlignment)textAlignment MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag{
    
    return  [self CreateLabelBorderColor:nil BorderWidth:0 TitleColor:titleColor BackgroundColor:backgroundColor MasksToBounds:MTB CornerRadius:cornerRadius TextAlignment:textAlignment Title:title Frame:frame Tag:tag];
}

+(UILabel *)CreateLabelBackgroundColor:(UIColor *)backgroundColor TextAlignment:(NSTextAlignment)textAlignment MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag{
    
    return  [self CreateLabelTitleColor:[UIColor blackColor] BackgroundColor:backgroundColor TextAlignment:textAlignment MasksToBounds:MTB CornerRadius:cornerRadius Title:title Frame:frame Tag:tag];
    
}

+(UILabel *)CreateLabelTextAlignment:(NSTextAlignment)textAlignment MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius  Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag{
    
    return [self CreateLabelBackgroundColor:nil TextAlignment:textAlignment MasksToBounds:MTB CornerRadius:cornerRadius Title:title Frame:frame Tag:tag];
}

+(UILabel *)CreateLabelMasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag{
    
    return [self CreateLabelTextAlignment:NSTextAlignmentCenter MasksToBounds:MTB CornerRadius:cornerRadius Title:title Frame:frame Tag:tag];
}

+(UILabel *)CreateLabelTitle:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag{
    
    return [self CreateLabelMasksToBounds:NO CornerRadius:0 Title:title Frame:frame Tag:tag];
}

+(UILabel *)CreateLabelTitle:(NSString *)title Frame:(CGRect)frame{
    
    return [self CreateLabelTitle:title Frame:frame Tag:0];
}



@end
