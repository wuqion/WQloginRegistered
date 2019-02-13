//
//  UIView+WQ_Corners.m
//  ChildrenPalace
//
//  Created by 吴琼 on 2018/12/17.
//  Copyright © 2018 吴琼. All rights reserved.
//

#import "UIView+WQ_Corners.h"

@implementation UIView (WQ_Corners)

/**
 view设置圆角
 
 @param corners UIRectCorner
 @param radii 圆角半径
 */
- (void)settingCorners:(UIRectCorner)corners cornerRadii:(CGFloat)radii {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
    self.layer.masksToBounds = YES;
}

- (void)settingCornersWithCornerRadii:(CGFloat)radii {
    [self settingCorners:UIRectCornerAllCorners cornerRadii:radii];
}


/**
 view设置圆角和边框
 
 @param cornerRadius 圆角半径
 @param borderWidth 线宽
 @param borderColor 线的颜色
 */
- (void)settingBorder:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor  {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)settingBorderWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor {
    [self settingBorder:0 borderWidth:borderWidth borderColor:borderColor];
}

@end
