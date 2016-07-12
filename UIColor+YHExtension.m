//
//  UIColor+YHExtension.m
//  Extension
//
//  Created by Yahaong on 16/7/12.
//  Copyright © 2016年 yahaong. All rights reserved.
//

#import "UIColor+YHExtension.h"

@implementation UIColor (YHExtension)

+ (UIColor *)yh_colorWithHex:(long)hexColor
{
    CGFloat red = ((CGFloat)((hexColor & 0xFF0000) >> 16))/255.0f;
    CGFloat green = ((CGFloat)((hexColor & 0xFF00) >> 8))/255.0f;
    CGFloat blue = ((CGFloat)(hexColor & 0xFF))/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

+ (UIColor *)yh_colorWithHex:(long)hexColor alpha:(CGFloat)alpha
{
    CGFloat red = ((CGFloat)((hexColor & 0xFF0000) >> 16))/255.0f;
    CGFloat green = ((CGFloat)((hexColor & 0xFF00) >> 8))/255.0f;
    CGFloat blue = ((CGFloat)(hexColor & 0xFF))/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)yh_colorWithHexString:(NSString *)hexString {
    return [[self class] yh_colorWithHexString:hexString alpha:1.0f];
}

+ (UIColor *)yh_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    
    if('#' != [hexString characterAtIndex:0]) {
        hexString = [NSString stringWithFormat:@"#%@", hexString];
    }
    assert(7 == hexString.length || 4 == hexString.length);
    hexString = [[self class] hexStringTransformFromThreeCharacters:hexString];
    
    NSString * redHex   = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(1, 2)]];
    unsigned redInt     = [[self class] hexValueToUnsigned:redHex];
    
    NSString * greenHex = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(3, 2)]];
    unsigned greenInt   = [[self class] hexValueToUnsigned:greenHex];
    
    NSString * blueHex  = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(5, 2)]];
    unsigned blueInt    = [[self class] hexValueToUnsigned:blueHex];
    
    return [UIColor yh_colorWith8BitRed:redInt green:greenInt blue:blueInt alpha:alpha];
}

+ (UIColor *)yh_colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [[self class] yh_colorWith8BitRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)yh_colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    
    UIColor *color = nil;
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    color = [UIColor colorWithRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];
#else
    color = [UIColor colorWithCalibratedRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];
#endif
    return color;
}
/** private method */
+ (NSString *)hexStringTransformFromThreeCharacters:(NSString *)hexString {
    
    if(hexString.length == 4) {
        hexString = [NSString stringWithFormat:@"#%@%@%@%@%@%@",
                     [hexString substringWithRange:NSMakeRange(1, 1)],[hexString substringWithRange:NSMakeRange(1, 1)],
                     [hexString substringWithRange:NSMakeRange(2, 1)],[hexString substringWithRange:NSMakeRange(2, 1)],
                     [hexString substringWithRange:NSMakeRange(3, 1)],[hexString substringWithRange:NSMakeRange(3, 1)]];
    }
    return hexString;
}
/** private method */
+ (unsigned)hexValueToUnsigned:(NSString *)hexValue {
    
    unsigned value = 0;
    NSScanner * hexValueScanner = [NSScanner scannerWithString:hexValue];
    [hexValueScanner scanHexInt:&value];
    return value;
}

@end
