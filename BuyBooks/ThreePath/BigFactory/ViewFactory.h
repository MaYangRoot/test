//
//  ViewFactory.h
//  Fcatory
//
//  Created by QianFeng on 15/9/13.
//  Copyright (c) 2015年 MaShaoYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewFactory : NSObject
+ (UIView *)createViewMasksToBounds:(BOOL)MTB CornerRadius:(CGFloat)cornerRadius BackGroundColor:(UIColor *)backgroundColor Frame:(CGRect)frame Tag:(NSUInteger)tag;
+ (UIView *)createViewBackGroundColor:(UIColor *)backgroundColor Frame:(CGRect)frame Tag:(NSUInteger)tag;
@end
