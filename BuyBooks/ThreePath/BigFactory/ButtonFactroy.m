//
//  ButtonFactroy.m
//  faction
//
//  Created by QianFeng on 15/9/9.
//  Copyright (c) 2015年 MaShaoYang. All rights reserved.
//

#import "ButtonFactroy.h"

@implementation ButtonFactroy
+(UIButton *)CreateButtonFontSize:(CGFloat)size TextAlignment:(NSTextAlignment)textAlignment BorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth TitleColor:(UIColor *)titleColor BackgroundImage:(UIImage *)backgroundImage Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame {
    
    UIButton * button = [[UIButton alloc]init];
    //设置字体大小
    button.titleLabel.font = [UIFont systemFontOfSize:size];
    //设置字体位置
    button.titleLabel.textAlignment = textAlignment;
    //设置边框
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = borderWidth;
    //设置标签颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    //设置背景图片
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button  setImage:image forState:UIControlStateNormal];
    //边框裁剪
    button.layer.masksToBounds = MTB;
    button.layer.cornerRadius = cornerRadius;
    //为button添加事件 添加状态
    [button addTarget:targar action:action forControlEvents:UIControlEvents];
    
    button.tag  = tag;
    //设置标签
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = frame;
    
    return button ;
}

+(UIButton *)CreateButtonTextAlignment:(NSTextAlignment)textAlignment BorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth TitleColor:(UIColor *)titleColor BackgroundImage:(UIImage *)backgroundImage Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame {
    
    return [self CreateButtonFontSize:14.f TextAlignment:textAlignment BorderColor:borderColor BorderWidth:borderWidth TitleColor:titleColor BackgroundImage:backgroundImage Image:image BackgroundColor:backgroundColor MasksToBounds:MTB CornerRadius:cornerRadius Targar:targar Action:action ForControlEvents:UIControlEvents Tag:tag Title:title Frame:frame];
    
}

+(UIButton *)CreateButtonBorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth TitleColor:(UIColor *)titleColor BackgroundImage:(UIImage *)backgroundImage Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame{
    
    return  [self CreateButtonTextAlignment:NSTextAlignmentCenter BorderColor:borderColor BorderWidth:borderWidth TitleColor:titleColor BackgroundImage:backgroundImage Image:image BackgroundColor:backgroundColor MasksToBounds:MTB CornerRadius:cornerRadius Targar:targar Action:action ForControlEvents:UIControlEvents Tag:tag Title:title Frame:frame];
}

+(UIButton *)CreateButtonTitleColor:(UIColor *)titleColor BackgroundImage:(UIImage *)backgroundImage Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame{
    
    return  [self CreateButtonBorderColor:[UIColor lightGrayColor] BorderWidth:0.3f TitleColor:titleColor BackgroundImage:backgroundImage Image:image BackgroundColor:backgroundColor MasksToBounds:MTB CornerRadius:cornerRadius Targar:targar Action:action ForControlEvents:UIControlEvents Tag:tag Title:title Frame:frame];
}

+(UIButton *)CreateButtonBackgroundImage:(UIImage *)backgroundImage Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame {
    
    return [self CreateButtonTitleColor:[UIColor blackColor] BackgroundImage:backgroundImage Image:image BackgroundColor:backgroundColor MasksToBounds:MTB CornerRadius:cornerRadius Targar:targar Action:action ForControlEvents:UIControlEvents Tag:tag Title:title Frame:frame];
}

+(UIButton *)CreateButtonImage:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame {
    
    return [self CreateButtonBackgroundImage:nil Image:image BackgroundColor:backgroundColor MasksToBounds:MTB CornerRadius:cornerRadius Targar:targar Action:action ForControlEvents:UIControlEvents Tag:tag Title:title Frame:frame];
}

+(UIButton *)CreateButtonBackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame {
    
    return [self CreateButtonImage:nil BackgroundColor:backgroundColor MasksToBounds:MTB CornerRadius:cornerRadius Targar:targar Action:action ForControlEvents:UIControlEvents Tag:tag Title:title Frame:frame];
}

+(UIButton *)CreateButtonMasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame {
    
    return [self CreateButtonBackgroundColor:nil MasksToBounds:MTB CornerRadius:cornerRadius Targar:targar Action:action ForControlEvents:UIControlEvents Tag:tag Title:title Frame:frame];
}

+(UIButton *)CreateButtonTargar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame {
    
    return [self CreateButtonMasksToBounds:NO CornerRadius:0 Targar:targar Action:action ForControlEvents:UIControlEvents Tag:tag Title:title Frame:frame];
}

+(UIButton *)CreateButtonTitle:(NSString *)title Frame:(CGRect)frame {
    
    return [self CreateButtonTargar:nil Action:nil ForControlEvents:UIControlEventTouchUpInside Tag:0 Title:title Frame:frame];
}
@end
