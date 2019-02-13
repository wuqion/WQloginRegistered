//
//  UIImage+Extension.h
//  Volunteer
//
//  Created by 吴琼 on 2019/1/10.
//  Copyright © 2019 Xinhuanet. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WQ_Extension)

+ (UIImage *)imageWithColor:(UIColor*)color;
+ (UIImage *)circleImageWithColor:(UIColor*)color;
+ (UIImage *)imageWithColor:(UIColor*)color size:(CGSize)size;
+ (UIImage *)circleImageWithColor:(UIColor*)color size:(CGSize)size;
+ (UIImage *)gradientImage:(CGSize)size
                   upColor:(UIColor *)upColor;

@end

NS_ASSUME_NONNULL_END
