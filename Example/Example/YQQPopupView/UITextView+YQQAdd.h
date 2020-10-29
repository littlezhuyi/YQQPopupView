//
//  UITextView+YQQAdd.h
//  Example
//
//  Created by zhuyi on 2020/10/29.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (YQQAdd)

@property (nonatomic, readonly) UITextView *placeholderTextView NS_SWIFT_NAME(placeholderTextView);

@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end

NS_ASSUME_NONNULL_END
