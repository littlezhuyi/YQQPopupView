//
//  UIColor+YQQAdd.m
//  Example
//
//  Created by zhuyi on 2020/10/22.
//

#import "UIColor+YQQAdd.h"

@implementation UIColor (YQQAdd)

+ (UIColor *)colorOfHex:(UInt32)hex alpha:(CGFloat)alpha {
    UIColor *color = [UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.0
                                     green:((hex & 0xFF00) >> 8) / 255.0
                                      blue:(hex & 0xFF) / 255.0
                                     alpha:alpha];
    return color;
}

@end
