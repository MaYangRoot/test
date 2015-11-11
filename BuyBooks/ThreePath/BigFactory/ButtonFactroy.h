//
//  ButtonFactroy.h
//  faction
//
//  Created by QianFeng on 15/9/9.
//  Copyright (c) 2015年 MaShaoYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ButtonFactroy : NSObject
+(UIButton *)CreateButtonFontSize:(CGFloat)size TextAlignment:(NSTextAlignment)textAlignment BorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth TitleColor:(UIColor *)titleColor BackgroundImage:(UIImage *)backgroundImage Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame ;

+(UIButton *)CreateButtonTextAlignment:(NSTextAlignment)textAlignment BorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth TitleColor:(UIColor *)titleColor BackgroundImage:(UIImage *)backgroundImage Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame ;

+(UIButton *)CreateButtonBorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth TitleColor:(UIColor *)titleColor BackgroundImage:(UIImage *)backgroundImage Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame ;

+(UIButton *)CreateButtonTitleColor:(UIColor *)titleColor BackgroundImage:(UIImage *)backgroundImage Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame ;

+(UIButton *)CreateButtonBackgroundImage:(UIImage *)backgroundImage Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame ;

+(UIButton *)CreateButtonImage:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame ;

+(UIButton *)CreateButtonBackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame ;

+(UIButton *)CreateButtonMasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Targar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame ;

+(UIButton *)CreateButtonTargar:(id)targar Action:(SEL)action ForControlEvents:(UIControlEvents)UIControlEvents Tag:(NSUInteger)tag Title:(NSString *)title Frame:(CGRect)frame ;

+(UIButton *)CreateButtonTitle:(NSString *)title Frame:(CGRect)frame ;
@end
