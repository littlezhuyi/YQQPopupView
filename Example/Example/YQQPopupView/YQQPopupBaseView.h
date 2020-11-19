//
//  YQQPopupBaseView.h
//  Example
//
//  Created by zhuyi on 2020/10/28.
//

#import <UIKit/UIKit.h>
#import "YQQPopupViewConfig.h"
@class YQQPopupButtonItem;
@class YQQPopupBaseView;

typedef NS_ENUM(NSUInteger, YQQPopupViewButtonType) {
    YQQPopupViewButtonTypeRoundCorner,
    YQQPopupViewButtonTypeShapeless
};

typedef NS_ENUM(NSUInteger, YQQPopupViewInputType) {
    YQQPopupViewInputTypeTextField,
    YQQPopupViewInputTypeTextView
};

typedef void(^SelectIndex)(NSInteger index, NSString * _Nullable inputContent);

NS_ASSUME_NONNULL_BEGIN

@interface YQQPopupBaseView : UIView

@property (nonatomic, assign) BOOL useMotionEffects;

@property (nonatomic, assign) BOOL closeOnTouchUpOutside;

@property (nonatomic, strong) UIView *attachedView;

@property (nonatomic, strong) NSArray *buttons;

@property (nonatomic, assign) YQQPopupViewButtonType buttonType;

@property (nonatomic, assign) YQQPopupViewInputType inputType;

@property (nonatomic, strong) YQQPopupViewConfig *popupViewConfig;

@property (nonatomic, assign) NSInteger textViewMaxLength;

@property (nonatomic, copy) NSString *placeholder;

#pragma mark - Public

- (void)show;

- (void)showInView:(UIView *)superView;

- (void)close;

+ (void)hideAllPopupView;

#pragma mark - Subclass Override

- (UIView *)fetchContentContainer;

- (void)dialogButtonDidClickWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
