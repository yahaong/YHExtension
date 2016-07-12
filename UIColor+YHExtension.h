//
//  UIColor+YHExtension.h
//  Extension
//
//  Created by Yahaong on 16/7/12.
//  Copyright © 2016年 yahaong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YHExtension)

+ (UIColor *)yh_colorWithHex:(long)hexColor;

+ (UIColor *)yh_colorWithHex:(long)hexColor alpha:(CGFloat)alpha;

+ (UIColor *)yh_colorWithHexString:(NSString *)hexString;

+ (UIColor *)yh_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (UIColor *)yh_colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

+ (UIColor *)yh_colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
@end
