//
//  YQQPopupView.m
//  Example
//
//  Created by zhuyi on 2020/10/29.
//

#import "YQQPopupView.h"
#import "YQQPopupViewConfig.h"
#import "UITextView+YQQAdd.h"

#define kContentContainerWidth 311

@interface YQQPopupView () <UITextViewDelegate, YQQPopupBaseViewDelegate>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *detail;

@property (nonatomic, assign) YQQPopupViewInputType inputType;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, assign) NSInteger textViewMaxLength;

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
                        buttonType:(YQQPopupViewButtonType)buttonType {
    return [self popupViewWithTitle:title detail:detail buttonTitles:@[@"确定"] buttonType:buttonType selectIndex:nil];
}

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                       selectIndex:(SelectIndex)selectIndex {
    return [self popupViewWithTitle:title detail:detail placeholder:nil buttonTitles:buttonTitles selectIndex:selectIndex];
}

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                        buttonType:(YQQPopupViewButtonType)buttonType
                       selectIndex:(SelectIndex)selectIndex {
    return [self popupViewWithTitle:title detail:detail placeholder:nil buttonTitles:buttonTitles buttonType:buttonType selectIndex:selectIndex];
}

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                       placeholder:(NSString *_Nullable)placeholder
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                       selectIndex:(SelectIndex)selectIndex {
    return [self popupViewWithTitle:title detail:detail placeholder:placeholder inputType:YQQPopupViewInputTypeTextField buttonTitles:buttonTitles selectIndex:selectIndex];
}

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                       placeholder:(NSString *_Nullable)placeholder
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                        buttonType:(YQQPopupViewButtonType)buttonType
                       selectIndex:(SelectIndex)selectIndex {
    return [self popupViewWithTitle:title detail:detail placeholder:placeholder inputType:YQQPopupViewInputTypeTextField buttonTitles:buttonTitles buttonType:buttonType selectIndex:selectIndex];
}

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                       placeholder:(NSString *_Nullable)placeholder
                         inputType:(YQQPopupViewInputType)inputType
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                       selectIndex:(SelectIndex)selectIndex {
    return [self popupViewWithTitle:title detail:detail inputType:inputType placeholder:placeholder buttonType:YQQPopupViewButtonTypeRoundCorner buttonTitles:buttonTitles textViewMaxLength:0 selectIndex:selectIndex];
}

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                       placeholder:(NSString *_Nullable)placeholder
                         inputType:(YQQPopupViewInputType)inputType
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                        buttonType:(YQQPopupViewButtonType)buttonType
                       selectIndex:(SelectIndex)selectIndex {
    return [self popupViewWithTitle:title detail:detail inputType:inputType placeholder:placeholder buttonType:buttonType buttonTitles:buttonTitles textViewMaxLength:0 selectIndex:selectIndex];
}

+ (instancetype)popupViewWithTitle:(NSString *)title
                            detail:(NSString *)detail
                         inputType:(YQQPopupViewInputType)inputType
                       placeholder:(NSString *)placeholder
                        buttonType:(YQQPopupViewButtonType)buttonType
                      buttonTitles:(NSArray *)buttonTitles
                 textViewMaxLength:(NSInteger)textViewMaxLength
                       selectIndex:(SelectIndex _Nullable)selectIndex{
    return [[self alloc] initWithTitle:title
                                detail:detail
                             inputType:inputType
                           placeholder:placeholder
                            buttonType:buttonType
                          buttonTitles:buttonTitles
                     textViewMaxLength:textViewMaxLength
                           selectIndex:selectIndex];
}

- (instancetype)initWithTitle:(NSString *)title
                       detail:(NSString *)detail
                    inputType:(YQQPopupViewInputType)inputType
                  placeholder:(NSString *)placeholder
                   buttonType:(YQQPopupViewButtonType)buttonType
                 buttonTitles:(NSArray *)buttonTitles
            textViewMaxLength:(NSInteger)textViewMaxLength
                  selectIndex:(SelectIndex _Nullable)selectIndex {
    self = [super init];
    if (self) {
        _title = title;
        _detail = detail;
        _inputType = inputType;
        _placeholder = placeholder;
        _textViewMaxLength = textViewMaxLength;
        self.buttons = buttonTitles;
        self.selectIndex = selectIndex;
        self.delegate = self;
        self.buttonType = buttonType;
        _shouldInspectIputViewBeforConfirm = _placeholder.length;
    }
    return self;
}

- (UIView *)fetchContentContainer {
    UIView *contentContainer = [[UIView alloc] init];
    CGFloat contentContainerHeight = 0;
    UIView *lastView;
    if (self.title.length) {
        CGFloat titleHeight = [self calculateTextWidth:self.title font:kYQQPopupViewConfig.titleFont];
        titleHeight = ceilf(titleHeight);
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kYQQPopupViewConfig.titleLabelMargin, kYQQPopupViewConfig.titleLabelTop, kContentContainerWidth - kYQQPopupViewConfig.titleLabelMargin * 2, titleHeight)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        titleLabel.font = kYQQPopupViewConfig.titleFont;
        titleLabel.textColor = kYQQPopupViewConfig.titleColor;
        titleLabel.text = self.title;
        [contentContainer addSubview:titleLabel];
        contentContainerHeight = contentContainerHeight + kYQQPopupViewConfig.titleLabelTop + titleHeight;
        lastView = titleLabel;
    }
    if (self.detail.length) {
        CGFloat detailHeight = [self calculateTextWidth:self.detail font:kYQQPopupViewConfig.detailFont];
        detailHeight = ceilf(detailHeight);
        UILabel *detailLabel = [[UILabel alloc] init];
        detailLabel.textAlignment = NSTextAlignmentCenter;
        detailLabel.numberOfLines = 0;
        detailLabel.font = kYQQPopupViewConfig.detailFont;
        detailLabel.textColor = kYQQPopupViewConfig.detailColor;
        detailLabel.text = self.detail;
        detailLabel.frame = CGRectMake(kYQQPopupViewConfig.detailLabelMargin, kYQQPopupViewConfig.detailLabelTop + CGRectGetMaxY(lastView.frame), ceilf(kContentContainerWidth - kYQQPopupViewConfig.detailLabelMargin * 2), detailHeight);
        [contentContainer addSubview:detailLabel];
        contentContainerHeight = contentContainerHeight + kYQQPopupViewConfig.detailLabelTop + detailHeight;
        lastView = detailLabel;
    }
    if (self.placeholder.length) {
        UIView *inputBackgroundView = [[UIView alloc] init];
        if (self.inputType == YQQPopupViewInputTypeTextField) {
            inputBackgroundView.backgroundColor = kYQQPopupViewConfig.textFieldBackgroundViewColor;
            inputBackgroundView.layer.cornerRadius = kYQQPopupViewConfig.textFieldBackgroundViewCornerRadius;
            inputBackgroundView.frame = CGRectMake(kYQQPopupViewConfig.inputViewMargin, kYQQPopupViewConfig.inputViewTop + CGRectGetMaxY(lastView.frame), kContentContainerWidth - kYQQPopupViewConfig.inputViewMargin * 2, kYQQPopupViewConfig.textFieldBackgroundViewHeight);
            [contentContainer addSubview:inputBackgroundView];
            lastView = inputBackgroundView;
            contentContainerHeight = contentContainerHeight + kYQQPopupViewConfig.inputViewTop + kYQQPopupViewConfig.textFieldBackgroundViewHeight;
            
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(kYQQPopupViewConfig.textFieldMargin, 0, kContentContainerWidth - kYQQPopupViewConfig.inputViewMargin * 2 - kYQQPopupViewConfig.textFieldMargin * 2, kYQQPopupViewConfig.textFieldBackgroundViewHeight)];
            textField.font = kYQQPopupViewConfig.inputFont;
            textField.textColor = kYQQPopupViewConfig.inputColor;
            [textField addTarget:self action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
            NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:kYQQPopupViewConfig.placeColor, NSFontAttributeName:kYQQPopupViewConfig.placeFont}];
            textField.attributedPlaceholder = placeholder;
            [inputBackgroundView addSubview:textField];
        } else {
            inputBackgroundView.layer.cornerRadius = kYQQPopupViewConfig.textViewBackgroundViewCornerRadius;
            inputBackgroundView.layer.borderColor = kYQQPopupViewConfig.textViewBackgroundViewBorderColor.CGColor;
            inputBackgroundView.layer.borderWidth = kYQQPopupViewConfig.textViewBackgroundViewBorderWidth;
            inputBackgroundView.frame = CGRectMake(kYQQPopupViewConfig.inputViewMargin, kYQQPopupViewConfig.inputViewTop + CGRectGetMaxY(lastView.frame), kContentContainerWidth - kYQQPopupViewConfig.inputViewMargin * 2, kYQQPopupViewConfig.textViewBackgroundViewHeight);
            [contentContainer addSubview:inputBackgroundView];
            lastView = inputBackgroundView;
            contentContainerHeight = contentContainerHeight + kYQQPopupViewConfig.inputViewTop + kYQQPopupViewConfig.textViewBackgroundViewHeight;
            
            UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(kYQQPopupViewConfig.textViewMargin, kYQQPopupViewConfig.textViewTop, CGRectGetWidth(inputBackgroundView.frame) - kYQQPopupViewConfig.textViewMargin * 2, CGRectGetHeight(inputBackgroundView.frame) - kYQQPopupViewConfig.textViewTop - kYQQPopupViewConfig.textViewBottom)];
            textView.font = kYQQPopupViewConfig.inputFont;
            textView.textColor = kYQQPopupViewConfig.inputColor;
            textView.delegate = self;
            NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:kYQQPopupViewConfig.placeColor, NSFontAttributeName:kYQQPopupViewConfig.placeFont}];
            textView.attributedPlaceholder = placeholder;
            [inputBackgroundView addSubview:textView];
            
            if (self.textViewMaxLength > 0) {
                self.textViewMaxLengthLabel = [[UILabel alloc] init];
                self.textViewMaxLengthLabel.textAlignment = NSTextAlignmentRight;
                self.textViewMaxLengthLabel.font = kYQQPopupViewConfig.textViewMaxLengthFont;
                self.textViewMaxLengthLabel.textColor = kYQQPopupViewConfig.textViewMaxLengthColor;
                self.textViewMaxLengthLabel.text = [NSString stringWithFormat:@"0/%ld", self.textViewMaxLength];
                self.textViewMaxLengthLabel.frame = CGRectMake(CGRectGetWidth(inputBackgroundView.frame) - 8 - 40, CGRectGetHeight(inputBackgroundView.frame) - 8 - 17, 40, 17);
                [inputBackgroundView addSubview:self.textViewMaxLengthLabel];
            }
        }
    }
    
    if (self.buttonType == YQQPopupViewButtonTypeShapeless) {
        contentContainer.frame = CGRectMake(0, 0, kContentContainerWidth, contentContainerHeight + kYQQPopupViewConfig.contentContainerIncrement);
    } else {
        contentContainer.frame = CGRectMake(0, 0, kContentContainerWidth, contentContainerHeight);
    }
    return contentContainer;
}

#pragma mark - UITextField

- (void)textFieldValueChanged:(UITextField *)textField {
    self.inputContent = textField.text;
}

#pragma mark - YQQPopupBaseViewDelegate

- (void)popupView:(YQQPopupBaseView *)popupView didSelectIndex:(NSInteger)index {
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

- (CGFloat)calculateTextWidth:(NSString *)text font:(UIFont *)font {
    NSDictionary *btAtt = @{NSFontAttributeName : font};
    CGSize textSize = CGSizeMake(kContentContainerWidth, CGFLOAT_MAX);
    CGRect textRect = [text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:btAtt context:nil];
    return textRect.size.height;
}

@end
