//
//  YQQPopupViewConfig.m
//  Example
//
//  Created by zhuyi on 2020/10/29.
//

#import "YQQPopupViewConfig.h"
#import "UIColor+YQQAdd.h"

@implementation YQQPopupViewConfig

+ (YQQPopupViewConfig *)sharedConfig {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _titleFont = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
        _detailFont = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _inputFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _placeFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _shapelessButtonFont = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
        _roundCornerButtonFont = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
        _textViewMaxLengthFont = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        
        _titleColor = [UIColor colorOfHex:0x282828 alpha:1.0];
        _detailColor = [UIColor colorOfHex:0x8C8C8C alpha:1.0];
        _inputColor = [UIColor colorOfHex:0x282828 alpha:1.0];
        _placeColor = [UIColor colorOfHex:0xC8C8C8 alpha:1.0];
        _textViewMaxLengthColor = [UIColor colorOfHex:0xC8C8C8 alpha:1.0];
        _shapelessCancelButtonTitleColor = [UIColor colorOfHex:0x8C8C8C alpha:1.0];
        _shapelessConfirmButtonTitleColor = [UIColor colorOfHex:0x1ACB97 alpha:1.0];
        _roundCornerCancelButtonTitleColor = [UIColor colorOfHex:0x1ACB97 alpha:1.0];
        _roundCornerConfirmButtonTitleColor = [UIColor colorOfHex:0xFFFFFF alpha:1.0];
        _roundCornerCancelButtonBackgroundColor = [UIColor colorOfHex:0xFFFFFF alpha:1.0];
        _roundCornerConfirmButtonBackgroundColor = [UIColor colorOfHex:0x1ACB97 alpha:1.0];
        _roundCornerCancelButtonBorderColor = [UIColor colorOfHex:0x1ACB97 alpha:1.0];
        _textFieldBackgroundViewColor = [UIColor colorOfHex:0xF8F8F8 alpha:1.0];
        _textViewBackgroundViewBorderColor = [UIColor colorOfHex:0xD8D8D8 alpha:1.0];
        _shapelessSeparatorBackgroundColor = [UIColor colorOfHex:0xD8D8D8 alpha:1.0];
        _dialogBackgroundColor = [UIColor colorOfHex:0xFFFFFF alpha:1.0];
        
        _titleLabelTop = 20.0;
        _titleLabelMargin = 20.0;
        _detailLabelTop = 16.0;
        _detailLabelMargin = 20.0;
        _inputViewTop = 20.0;
        _inputViewMargin = 20.0;
        _buttonViewTop = 20.0;
        _roundCornerButtonMargin = 20.0;
        _roundCornerButtonMiddleMargin = 16.0;
        _shapelessHorizontalSeparatorMargin = 0.0;
        _shapelessVerticalSeparatorMargin = 0.0;
        _textFieldMargin = 8;
        _textViewMargin = 16;
        _textViewTop = 8;
        _textViewBottom = 33.0;
        
        _textFieldBackgroundViewHeight = 40.0;
        _textViewBackgroundViewHeight = 125.0;
        _roundCornerButtonBackgroundViewHeight = 80.0;
        _roundCornerButtonHeight = 40.0;
        _shapelessButtonHeight = 54.0;
        _shapelessSeparatorHeight = 0.6;
        _contentContainerIncrement = 16.0;
        
        _dialogCornerRadius = 6.0;
        _roundCornerButtonCornerRadius = 20.0;
        _textFieldBackgroundViewCornerRadius = 20.0;
        _textViewBackgroundViewCornerRadius = 6.0;
        
        _textViewBackgroundViewBorderWidth = 1.0;
        _roundCornerCancelButtonBorderWidth = 1.0;
        
        _motionEffectExtent = 10.0;
    }
    return self;
}

@end
