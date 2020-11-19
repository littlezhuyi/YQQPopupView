//
//  YQQPopupViewConfig.h
//  Example
//
//  Created by zhuyi on 2020/10/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YQQPopupViewConfig : NSObject

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *detailFont;
@property (nonatomic, strong) UIFont *inputFont;
@property (nonatomic, strong) UIFont *placeFont;
@property (nonatomic, strong) UIFont *shapelessButtonFont;
@property (nonatomic, strong) UIFont *roundCornerButtonFont;
@property (nonatomic, strong) UIFont *textViewMaxLengthFont;

@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *detailColor;
@property (nonatomic, strong) UIColor *inputColor;
@property (nonatomic, strong) UIColor *placeColor;
@property (nonatomic, strong) UIColor *textViewMaxLengthColor;
@property (nonatomic, strong) UIColor *shapelessCancelButtonTitleColor;
@property (nonatomic, strong) UIColor *shapelessConfirmButtonTitleColor;
@property (nonatomic, strong) UIColor *roundCornerCancelButtonTitleColor;
@property (nonatomic, strong) UIColor *roundCornerConfirmButtonTitleColor;
@property (nonatomic, strong) UIColor *roundCornerCancelButtonBackgroundColor;
@property (nonatomic, strong) UIColor *roundCornerCancelButtonBorderColor;
@property (nonatomic, strong) UIColor *roundCornerConfirmButtonBackgroundColor;
@property (nonatomic, strong) UIColor *textFieldBackgroundViewColor;
@property (nonatomic, strong) UIColor *textViewBackgroundViewBorderColor;
@property (nonatomic, strong) UIColor *shapelessSeparatorBackgroundColor;
@property (nonatomic, strong) UIColor *dialogBackgroundColor;

@property (nonatomic, assign) CGFloat titleLabelTop;
@property (nonatomic, assign) CGFloat titleLabelMargin;
@property (nonatomic, assign) CGFloat detailLabelTop;
@property (nonatomic, assign) CGFloat detailLabelMargin;
@property (nonatomic, assign) CGFloat inputViewTop;
@property (nonatomic, assign) CGFloat inputViewMargin;
@property (nonatomic, assign) CGFloat buttonViewTop;
@property (nonatomic, assign) CGFloat roundCornerButtonMargin;
@property (nonatomic, assign) CGFloat roundCornerButtonMiddleMargin;
@property (nonatomic, assign) CGFloat shapelessHorizontalSeparatorMargin;
@property (nonatomic, assign) CGFloat shapelessVerticalSeparatorMargin;
@property (nonatomic, assign) CGFloat textFieldMargin;
@property (nonatomic, assign) CGFloat textViewMargin;
@property (nonatomic, assign) CGFloat textViewTop;
@property (nonatomic, assign) CGFloat textViewBottom;

@property (nonatomic, assign) CGFloat textFieldBackgroundViewHeight;
@property (nonatomic, assign) CGFloat textViewBackgroundViewHeight;
@property (nonatomic, assign) CGFloat roundCornerButtonBackgroundViewHeight;
@property (nonatomic, assign) CGFloat roundCornerButtonHeight;
@property (nonatomic, assign) CGFloat shapelessButtonHeight;
@property (nonatomic, assign) CGFloat shapelessSeparatorHeight;
@property (nonatomic, assign) CGFloat contentContainerIncrement;

@property (nonatomic, assign) CGFloat dialogCornerRadius;
@property (nonatomic, assign) CGFloat roundCornerButtonCornerRadius;
@property (nonatomic, assign) CGFloat textFieldBackgroundViewCornerRadius;
@property (nonatomic, assign) CGFloat textViewBackgroundViewCornerRadius;

@property (nonatomic, assign) CGFloat textViewBackgroundViewBorderWidth;
@property (nonatomic, assign) CGFloat roundCornerCancelButtonBorderWidth;

@property (nonatomic, assign) CGFloat motionEffectExtent;

+ (YQQPopupViewConfig *)defaultConfig;

+ (YQQPopupViewConfig *)redConfig;

@end

NS_ASSUME_NONNULL_END
