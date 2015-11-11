//
//  LabelFactory.h
//  faction
//
//  Created by QianFeng on 15/9/9.
//  Copyright (c) 2015年 MaShaoYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LabelFactory : NSObject


+(UILabel *)CreateLabelFontSize:(CGFloat)size BorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)BWidth TitleColor:(UIColor *)titleColor BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius TextAlignment:(NSTextAlignment)textAlignment Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag;

+(UILabel *)CreateLabelBorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)BWidth TitleColor:(UIColor *)titleColor BackgroundColor:(UIColor *)backgroundColor MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius TextAlignment:(NSTextAlignment)textAlignment Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag;

+(UILabel *)CreateLabelTitleColor:(UIColor *)titleColor BackgroundColor:(UIColor *)backgroundColor TextAlignment:(NSTextAlignment)textAlignment MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag;

+(UILabel *)CreateLabelBackgroundColor:(UIColor *)backgroundColor TextAlignment:(NSTextAlignment)textAlignment MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag;

+(UILabel *)CreateLabelTextAlignment:(NSTextAlignment)textAlignment MasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius  Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag;

+(UILabel *)CreateLabelMasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius Title:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag;

+(UILabel *)CreateLabelTitle:(NSString *)title Frame:(CGRect)frame Tag:(NSUInteger)tag;

+(UILabel *)CreateLabelTitle:(NSString *)title Frame:(CGRect)frame;


@end
