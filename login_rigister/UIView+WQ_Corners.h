//
//  UIView+WQ_Corners.h
//  ChildrenPalace
//
//  Created by 吴琼 on 2018/12/17.
//  Copyright © 2018 吴琼. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WQ_Corners)

/**
 view设置圆角
 
 @param corners UIRectCorner
 @param radii 圆角半径
 */
- (void)settingCorners:(UIRectCorner)corners cornerRadii:(CGFloat)radii;
- (void)settingCornersWithCornerRadii:(CGFloat)radii;

/**
 view设置圆角和边框
 
 @param cornerRadius 圆角半径
 @param borderWidth 线宽
 @param borderColor 线的颜色
 */
- (void)settingBorder:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor;
- (void)settingBorderWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor;

@end

NS_ASSUME_NONNULL_END
