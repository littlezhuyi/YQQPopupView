//
//  YQQPopupBaseView.h
//  Example
//
//  Created by zhuyi on 2020/10/28.
//

#import <UIKit/UIKit.h>
@class YQQPopupButtonItem;

NS_ASSUME_NONNULL_BEGIN

@interface YQQPopupBaseView : UIView

@property (nonatomic, assign) BOOL useMotionEffects;

@property (nonatomic, assign) BOOL closeOnTouchUpOutside;

@property (nonatomic, assign) CGFloat separatorHeight;

@property (nonatomic, assign) CGFloat buttonContainerHeight;

@property (nonatomic, assign) CGFloat motionEffectExtent;

@property (nonatomic, strong) UIView *attachedView;

@property (nonatomic, strong) NSArray<YQQPopupButtonItem *> *itemArray;

#pragma mark - Public

- (void)show;

- (void)showInView:(UIView *)superView;

- (void)close;

#pragma mark - Subclass Override

- (NSArray<YQQPopupButtonItem *> *)fetchItemArray;

- (UIView *)fetchContentContainer;

@end

NS_ASSUME_NONNULL_END
