//
//  YQQPopupViewConfig.m
//  Example
//
//  Created by zhuyi on 2020/10/29.
//

#import "YQQPopupViewConfig.h"
#import "UIColor+YQQAdd.h"

@implementation YQQPopupViewConfig

+ (YQQPopupViewConfig *)defaultConfig {
    YQQPopupViewConfig *defaultConfig = [[self alloc] init];
    defaultConfig.titleFont = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
    defaultConfig.detailFont = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    defaultConfig.inputFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    defaultConfig.placeFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    defaultConfig.shapelessButtonFont = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
    defaultConfig.roundCornerButtonFont = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
    defaultConfig.textViewMaxLengthFont = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    
    defaultConfig.titleColor = [UIColor colorOfHex:0x282828 alpha:1.0];
    defaultConfig.detailColor = [UIColor colorOfHex:0x8C8C8C alpha:1.0];
    defaultConfig.inputColor = [UIColor colorOfHex:0x282828 alpha:1.0];
    defaultConfig.placeColor = [UIColor colorOfHex:0xC8C8C8 alpha:1.0];
    defaultConfig.textViewMaxLengthColor = [UIColor colorOfHex:0xC8C8C8 alpha:1.0];
    defaultConfig.shapelessCancelButtonTitleColor = [UIColor colorOfHex:0x8C8C8C alpha:1.0];
    defaultConfig.shapelessConfirmButtonTitleColor = [UIColor colorOfHex:0x1ACB97 alpha:1.0];
    defaultConfig.roundCornerCancelButtonTitleColor = [UIColor colorOfHex:0x1ACB97 alpha:1.0];
    defaultConfig.roundCornerConfirmButtonTitleColor = [UIColor colorOfHex:0xFFFFFF alpha:1.0];
    defaultConfig.roundCornerCancelButtonBackgroundColor = [UIColor colorOfHex:0xFFFFFF alpha:1.0];
    defaultConfig.roundCornerConfirmButtonBackgroundColor = [UIColor colorOfHex:0x1ACB97 alpha:1.0];
    defaultConfig.roundCornerCancelButtonBorderColor = [UIColor colorOfHex:0x1ACB97 alpha:1.0];
    defaultConfig.textFieldBackgroundViewColor = [UIColor colorOfHex:0xF8F8F8 alpha:1.0];
    defaultConfig.textViewBackgroundViewBorderColor = [UIColor colorOfHex:0xD8D8D8 alpha:1.0];
    defaultConfig.shapelessSeparatorBackgroundColor = [UIColor colorOfHex:0xD8D8D8 alpha:1.0];
    defaultConfig.dialogBackgroundColor = [UIColor colorOfHex:0xFFFFFF alpha:1.0];
    
    defaultConfig.titleLabelTop = 20.0;
    defaultConfig.titleLabelMargin = 20.0;
    defaultConfig.detailLabelTop = 16.0;
    defaultConfig.detailLabelMargin = 20.0;
    defaultConfig.inputViewTop = 20.0;
    defaultConfig.inputViewMargin = 20.0;
    defaultConfig.buttonViewTop = 20.0;
    defaultConfig.roundCornerButtonMargin = 20.0;
    defaultConfig.roundCornerButtonMiddleMargin = 16.0;
    defaultConfig.shapelessHorizontalSeparatorMargin = 0.0;
    defaultConfig.shapelessVerticalSeparatorMargin = 0.0;
    defaultConfig.textFieldMargin = 8;
    defaultConfig.textViewMargin = 16;
    defaultConfig.textViewTop = 8;
    defaultConfig.textViewBottom = 33.0;
    
    defaultConfig.textFieldBackgroundViewHeight = 40.0;
    defaultConfig.textViewBackgroundViewHeight = 125.0;
    defaultConfig.roundCornerButtonBackgroundViewHeight = 80.0;
    defaultConfig.roundCornerButtonHeight = 40.0;
    defaultConfig.shapelessButtonHeight = 54.0;
    defaultConfig.shapelessSeparatorHeight = 0.5;
    defaultConfig.contentContainerIncrement = 40.0;
    
    defaultConfig.dialogCornerRadius = 6.0;
    defaultConfig.roundCornerButtonCornerRadius = 20.0;
    defaultConfig.textFieldBackgroundViewCornerRadius = 20.0;
    defaultConfig.textViewBackgroundViewCornerRadius = 6.0;
    
    defaultConfig.textViewBackgroundViewBorderWidth = 1.0;
    defaultConfig.roundCornerCancelButtonBorderWidth = 1.0;
    
    defaultConfig.motionEffectExtent = 10.0;
    return defaultConfig;
}

+ (YQQPopupViewConfig *)redConfig {
    YQQPopupViewConfig *defaultConfig = [[self alloc] init];
    defaultConfig.titleFont = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
    defaultConfig.detailFont = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    defaultConfig.inputFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    defaultConfig.placeFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    defaultConfig.shapelessButtonFont = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
    defaultConfig.roundCornerButtonFont = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
    defaultConfig.textViewMaxLengthFont = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    
    defaultConfig.titleColor = [UIColor colorOfHex:0x282828 alpha:1.0];
    defaultConfig.detailColor = [UIColor colorOfHex:0x8C8C8C alpha:1.0];
    defaultConfig.inputColor = [UIColor colorOfHex:0x282828 alpha:1.0];
    defaultConfig.placeColor = [UIColor colorOfHex:0xC8C8C8 alpha:1.0];
    defaultConfig.textViewMaxLengthColor = [UIColor colorOfHex:0xC8C8C8 alpha:1.0];
    defaultConfig.shapelessCancelButtonTitleColor = [UIColor colorOfHex:0x8C8C8C alpha:1.0];
    defaultConfig.shapelessConfirmButtonTitleColor = [UIColor colorOfHex:0x1ACB97 alpha:1.0];
    defaultConfig.roundCornerCancelButtonTitleColor = [UIColor colorOfHex:0xF9382B alpha:1.0];
    defaultConfig.roundCornerConfirmButtonTitleColor = [UIColor colorOfHex:0xFFFFFF alpha:1.0];
    defaultConfig.roundCornerCancelButtonBackgroundColor = [UIColor colorOfHex:0xFFFFFF alpha:1.0];
    defaultConfig.roundCornerConfirmButtonBackgroundColor = [UIColor colorOfHex:0xF9382B alpha:1.0];
    defaultConfig.roundCornerCancelButtonBorderColor = [UIColor colorOfHex:0xF9382B alpha:1.0];
    defaultConfig.textFieldBackgroundViewColor = [UIColor colorOfHex:0xF8F8F8 alpha:1.0];
    defaultConfig.textViewBackgroundViewBorderColor = [UIColor colorOfHex:0xD8D8D8 alpha:1.0];
    defaultConfig.shapelessSeparatorBackgroundColor = [UIColor colorOfHex:0xD8D8D8 alpha:1.0];
    defaultConfig.dialogBackgroundColor = [UIColor colorOfHex:0xFFFFFF alpha:1.0];
    
    defaultConfig.titleLabelTop = 20.0;
    defaultConfig.titleLabelMargin = 20.0;
    defaultConfig.detailLabelTop = 16.0;
    defaultConfig.detailLabelMargin = 20.0;
    defaultConfig.inputViewTop = 20.0;
    defaultConfig.inputViewMargin = 20.0;
    defaultConfig.buttonViewTop = 20.0;
    defaultConfig.roundCornerButtonMargin = 20.0;
    defaultConfig.roundCornerButtonMiddleMargin = 16.0;
    defaultConfig.shapelessHorizontalSeparatorMargin = 0.0;
    defaultConfig.shapelessVerticalSeparatorMargin = 0.0;
    defaultConfig.textFieldMargin = 8;
    defaultConfig.textViewMargin = 16;
    defaultConfig.textViewTop = 8;
    defaultConfig.textViewBottom = 33.0;
    
    defaultConfig.textFieldBackgroundViewHeight = 40.0;
    defaultConfig.textViewBackgroundViewHeight = 125.0;
    defaultConfig.roundCornerButtonBackgroundViewHeight = 80.0;
    defaultConfig.roundCornerButtonHeight = 40.0;
    defaultConfig.shapelessButtonHeight = 54.0;
    defaultConfig.shapelessSeparatorHeight = 0.5;
    defaultConfig.contentContainerIncrement = 40.0;
    
    defaultConfig.dialogCornerRadius = 6.0;
    defaultConfig.roundCornerButtonCornerRadius = 20.0;
    defaultConfig.textFieldBackgroundViewCornerRadius = 20.0;
    defaultConfig.textViewBackgroundViewCornerRadius = 6.0;
    
    defaultConfig.textViewBackgroundViewBorderWidth = 1.0;
    defaultConfig.roundCornerCancelButtonBorderWidth = 1.0;
    
    defaultConfig.motionEffectExtent = 10.0;
    return defaultConfig;
}

@end
