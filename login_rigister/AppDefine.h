//
//  AppDefine.h
//  ChildrenPalace
//
//  Created by Ji Feng on 2018/12/17.
//  Copyright © 2018 Ji Feng. All rights reserved.
//

#ifndef AppDefine_h
#define AppDefine_h

#pragma mark - 屏幕宽高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//#pragma mark -  颜色相关
#define UICOLOR_FROMRGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]
//#pragma make - 常用颜色
#define WQ_COLOR_BLACK UICOLOR_FROMRGB(0x000000)
#define WQ_COLOR_WHITE UICOLOR_FROMRGB(0xffffff)
#define WQ_COLOR_GRAY UICOLOR_FROMRGB(0xe6e6e6)
#define WQ_COLOR_RED UICOLOR_FROMRGB(0xEE242A)
#define WQ_COLOR_ORANGE UICOLOR_FROMRGB(0xFF8010)
//
//
//
#define WQ_COLOR_GRAY_22 UICOLOR_FROMRGB(0x222222)

//#pragma mark - 常用数值
#define WQ_MARGIN_LEFT 15
//
//#pragma make - 常有字号
#define WQ_FONT(size) [UIFont systemFontOfSize:(size)]
#define WQ_FONT10  WQ_FONT(10)
#define WQ_FONT13  WQ_FONT(13)
#define WQ_FONT14  WQ_FONT(14)
#define WQ_FONT15  WQ_FONT(15)
#define WQ_FONT17  WQ_FONT(17)

//#pragma make - 常用图片
#define WQ_IMG(img) [UIImage imageNamed:(img)]

//#pragma mark -  循环引用
#define WeakSelf __weak typeof(self) weakSelf = self;

//#pragma mark -  调试
//#ifdef DEBUG
//#define Log(...) printf("%s %s\n",[[NSDate date] descriptionWithLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"]].UTF8String,[[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
//#define DBLog(...) Log(__VA_ARGS__)
//#define DBFuncLog(xx, ...) Log(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
//
//#else
//#define DBLog(...) /* */
//#define DBFuncLog(xx, ...)
//#endif

#endif /* AppDefine_h */
