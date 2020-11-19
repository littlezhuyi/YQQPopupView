//
//  YQQPopupView.m
//  Example
//
//  Created by zhuyi on 2020/10/29.
//

#import "YQQPopupView.h"
#import "YQQPopupViewConfig.h"
#import "UITextView+YQQAdd.h"

#define kContentContainerWidth ([UIScreen mainScreen].bounds.size.width - 64)

@interface YQQPopupView () <UITextViewDelegate>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *detail;

@property (nonatomic, strong) UILabel *textViewMaxLengthLabel;

@property (nonatomic, copy) SelectIndex selectIndex;

@property (nonatomic, copy) NSString *inputContent;

@property (nonatomic, assign) BOOL shouldInspectIputViewBeforConfirm;

@end

@implementation YQQPopupView

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail {
    return [self popupViewWithTitle:title detail:detail buttonTitles:@[@"确定"] selectIndex:nil];
}

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                       selectIndex:(SelectIndex)selectIndex {
    return [self popupViewWithTitle:title detail:detail placeholder:nil buttonTitles:buttonTitles selectIndex:selectIndex];
}

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                       placeholder:(NSString *_Nullable)placeholder
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                       selectIndex:(SelectIndex)selectIndex {
    return [self popupViewWithTitle:title
                             detail:detail
                        placeholder:placeholder
                          inputType:YQQPopupViewInputTypeTextView
                       buttonTitles:buttonTitles
                         buttonType:YQQPopupViewButtonTypeRoundCorner
                        selectIndex:selectIndex];
}

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                       placeholder:(NSString *_Nullable)placeholder
                         inputType:(YQQPopupViewInputType)inputType
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                        buttonType:(YQQPopupViewButtonType)buttonType
                       selectIndex:(SelectIndex _Nullable)selectIndex {
    return [[self alloc] initWithTitle:title
                                detail:detail
                           placeholder:placeholder
                             inputType:inputType
                          buttonTitles:buttonTitles
                            buttonType:buttonType
                           selectIndex:selectIndex];
}

- (instancetype)initWithTitle:(NSString *_Nullable)title
                       detail:(NSString *_Nullable)detail
                  placeholder:(NSString *_Nullable)placeholder
                    inputType:(YQQPopupViewInputType)inputType
                 buttonTitles:(NSArray *_Nullable)buttonTitles
                   buttonType:(YQQPopupViewButtonType)buttonType
                  selectIndex:(SelectIndex _Nullable)selectIndex {
    self = [super init];
    if (self) {
        _title = title;
        _detail = detail;
        self.inputType = inputType;
        self.placeholder = placeholder;
        self.buttons = buttonTitles;
        self.selectIndex = selectIndex;
        self.buttonType = buttonType;
        _shouldInspectIputViewBeforConfirm = self.placeholder.length;
    }
    return self;
}

- (UIView *)fetchContentContainer {
    UIView *contentContainer = [[UIView alloc] init];
    CGFloat contentContainerHeight = 0;
    UIView *lastView;
    if (self.title.length) {
        CGSize titleSize = [self calculateTextWidth:self.title font:self.popupViewConfig.titleFont margin:self.popupViewConfig.titleLabelMargin];
        CGFloat titleHeight = ceilf(titleSize.height);
        UILabel *titleLabel = [[UILabel alloc] init];
        if (titleSize.width > kContentContainerWidth - self.popupViewConfig.titleLabelMargin * 2) {
            titleLabel.frame = CGRectMake(self.popupViewConfig.titleLabelMargin, self.popupViewConfig.titleLabelTop, kContentContainerWidth - self.popupViewConfig.titleLabelMargin * 2, titleHeight);
        } else {
            titleLabel.frame = CGRectMake(floorf((kContentContainerWidth - titleSize.width) / 2.0), self.popupViewConfig.titleLabelTop, ceilf(titleSize.width), titleHeight);
        }
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        titleLabel.font = self.popupViewConfig.titleFont;
        titleLabel.textColor = self.popupViewConfig.titleColor;
        titleLabel.text = self.title;
        [contentContainer addSubview:titleLabel];
        contentContainerHeight = contentContainerHeight + self.popupViewConfig.titleLabelTop + titleHeight;
        lastView = titleLabel;
    }
    if (self.detail.length) {
        CGSize detailSize = [self calculateTextWidth:self.detail font:self.popupViewConfig.detailFont margin:self.popupViewConfig.detailLabelMargin];
        CGFloat detailHeight = ceilf(detailSize.height);
        UILabel *detailLabel = [[UILabel alloc] init];
        detailLabel.textAlignment = NSTextAlignmentLeft;
        detailLabel.numberOfLines = 0;
        detailLabel.font = self.popupViewConfig.detailFont;
        detailLabel.textColor = self.popupViewConfig.detailColor;
        detailLabel.text = self.detail;
        if (detailSize.width > kContentContainerWidth - self.popupViewConfig.titleLabelMargin * 2) {
            detailLabel.frame = CGRectMake(self.popupViewConfig.detailLabelMargin, self.popupViewConfig.detailLabelTop + CGRectGetMaxY(lastView.frame), ceilf(kContentContainerWidth - self.popupViewConfig.detailLabelMargin * 2), detailHeight);
        } else {
            detailLabel.frame = CGRectMake(floorf((kContentContainerWidth - detailSize.width) / 2.0), self.popupViewConfig.detailLabelTop + CGRectGetMaxY(lastView.frame), ceilf(detailSize.width), detailHeight);
        }
        [contentContainer addSubview:detailLabel];
        contentContainerHeight = contentContainerHeight + self.popupViewConfig.detailLabelTop + detailHeight;
        lastView = detailLabel;
    }
    if (self.placeholder.length) {
        UIView *inputBackgroundView = [[UIView alloc] init];
        if (self.inputType == YQQPopupViewInputTypeTextField) {
            inputBackgroundView.backgroundColor = self.popupViewConfig.textFieldBackgroundViewColor;
            inputBackgroundView.layer.cornerRadius = self.popupViewConfig.textFieldBackgroundViewCornerRadius;
            inputBackgroundView.frame = CGRectMake(self.popupViewConfig.inputViewMargin, self.popupViewConfig.inputViewTop + CGRectGetMaxY(lastView.frame), kContentContainerWidth - self.popupViewConfig.inputViewMargin * 2, self.popupViewConfig.textFieldBackgroundViewHeight);
            [contentContainer addSubview:inputBackgroundView];
            lastView = inputBackgroundView;
            contentContainerHeight = contentContainerHeight + self.popupViewConfig.inputViewTop + self.popupViewConfig.textFieldBackgroundViewHeight;
            
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(self.popupViewConfig.textFieldMargin, 0, kContentContainerWidth - self.popupViewConfig.inputViewMargin * 2 - self.popupViewConfig.textFieldMargin * 2, self.popupViewConfig.textFieldBackgroundViewHeight)];
            textField.font = self.popupViewConfig.inputFont;
            textField.textColor = self.popupViewConfig.inputColor;
            [textField addTarget:self action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
            NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:self.popupViewConfig.placeColor, NSFontAttributeName:self.popupViewConfig.placeFont}];
            textField.attributedPlaceholder = placeholder;
            [inputBackgroundView addSubview:textField];
        } else {
            inputBackgroundView.layer.cornerRadius = self.popupViewConfig.textViewBackgroundViewCornerRadius;
            inputBackgroundView.layer.borderColor = self.popupViewConfig.textViewBackgroundViewBorderColor.CGColor;
            inputBackgroundView.layer.borderWidth = self.popupViewConfig.textViewBackgroundViewBorderWidth;
            inputBackgroundView.frame = CGRectMake(self.popupViewConfig.inputViewMargin, self.popupViewConfig.inputViewTop + CGRectGetMaxY(lastView.frame), kContentContainerWidth - self.popupViewConfig.inputViewMargin * 2, self.popupViewConfig.textViewBackgroundViewHeight);
            [contentContainer addSubview:inputBackgroundView];
            lastView = inputBackgroundView;
            contentContainerHeight = contentContainerHeight + self.popupViewConfig.inputViewTop + self.popupViewConfig.textViewBackgroundViewHeight;
            
            UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(self.popupViewConfig.textViewMargin, self.popupViewConfig.textViewTop, CGRectGetWidth(inputBackgroundView.frame) - self.popupViewConfig.textViewMargin * 2, CGRectGetHeight(inputBackgroundView.frame) - self.popupViewConfig.textViewTop - self.popupViewConfig.textViewBottom)];
            textView.font = self.popupViewConfig.inputFont;
            textView.textColor = self.popupViewConfig.inputColor;
            textView.delegate = self;
            NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:self.popupViewConfig.placeColor, NSFontAttributeName:self.popupViewConfig.placeFont}];
            textView.attributedPlaceholder = placeholder;
            [inputBackgroundView addSubview:textView];
            
            if (self.textViewMaxLength > 0) {
                self.textViewMaxLengthLabel = [[UILabel alloc] init];
                self.textViewMaxLengthLabel.textAlignment = NSTextAlignmentRight;
                self.textViewMaxLengthLabel.font = self.popupViewConfig.textViewMaxLengthFont;
                self.textViewMaxLengthLabel.textColor = self.popupViewConfig.textViewMaxLengthColor;
                self.textViewMaxLengthLabel.text = [NSString stringWithFormat:@"0/%ld", self.textViewMaxLength];
                self.textViewMaxLengthLabel.frame = CGRectMake(CGRectGetWidth(inputBackgroundView.frame) - 8 - 40, CGRectGetHeight(inputBackgroundView.frame) - 8 - 17, 40, 17);
                [inputBackgroundView addSubview:self.textViewMaxLengthLabel];
            }
        }
    }
    
    if (self.buttonType == YQQPopupViewButtonTypeShapeless) {
        contentContainer.frame = CGRectMake(0, 0, kContentContainerWidth, contentContainerHeight + self.popupViewConfig.contentContainerIncrement);
    } else {
        contentContainer.frame = CGRectMake(0, 0, kContentContainerWidth, contentContainerHeight);
    }
    return contentContainer;
}

- (void)dialogButtonDidClickWithIndex:(NSInteger)index {
    if (index == 0) {
        if (self.selectIndex) {
            self.selectIndex(0, nil);
        }
        [self close];
    } else {
        if (self.shouldInspectIputViewBeforConfirm) {
            if (self.inputContent.length != 0) {
                if (self.selectIndex) {
                    self.selectIndex(1, self.inputContent);
                }
                [self close];
            }
        } else {
            if (self.selectIndex) {
                self.selectIndex(1, nil);
            }
            [self close];
        }
    }
}

#pragma mark - UITextField

- (void)textFieldValueChanged:(UITextField *)textField {
    self.inputContent = textField.text;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    if (self.textViewMaxLength != 0) {
        if (textView.text.length <= self.textViewMaxLength) {
            self.textViewMaxLengthLabel.text = [NSString stringWithFormat:@"%lu/%ld", (unsigned long)textView.text.length, (long)self.textViewMaxLength];
        } else {
            textView.text = [textView.text substringWithRange:NSMakeRange(0, self.textViewMaxLength)];
        }
    }
    self.inputContent = textView.text;
}

#pragma mark - Private

- (CGSize)calculateTextWidth:(NSString *)text font:(UIFont *)font margin:(CGFloat)margin {
    NSDictionary *btAtt = @{NSFontAttributeName : font};
    CGSize textSize = CGSizeMake(kContentContainerWidth - margin * 2, CGFLOAT_MAX);
    CGRect textRect = [text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:btAtt context:nil];
    return textRect.size;
}

@end
