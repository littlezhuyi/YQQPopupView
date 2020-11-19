//
//  YQQPopupBaseView.m
//  Example
//
//  Created by zhuyi on 2020/10/28.
//

#import "YQQPopupBaseView.h"

@interface YQQPopupBaseView ()

@property (nonatomic, strong) UIView *contentContainer;

@property (nonatomic, strong) UIView *dialogView;

@end

@implementation YQQPopupBaseView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _useMotionEffects = YES;
        _closeOnTouchUpOutside = YES;
        _attachedView = [UIApplication sharedApplication].delegate.window;
        _buttons = @[@"ok"];
        _textViewMaxLength = 50;
        _popupViewConfig = [YQQPopupViewConfig defaultConfig];
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(close) name:@"hideAllPopupView" object:nil];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%@♻️♻️", NSStringFromClass([self class]));
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"hideAllPopupView" object:nil];
}

#pragma mark - Private

- (void)addButtons {
    CGSize contentContainerSize = [self contentContainerSize];
    if (self.buttonType == YQQPopupViewButtonTypeRoundCorner) {
        UIView *buttonBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, contentContainerSize.height, contentContainerSize.width, self.popupViewConfig.roundCornerButtonBackgroundViewHeight)];
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.tag = 0;
        [leftButton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.tag = 1;
        [rightButton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        if (self.buttons.count == 1) {
            leftButton.frame = CGRectMake(self.popupViewConfig.roundCornerButtonMargin, (self.popupViewConfig.roundCornerButtonBackgroundViewHeight - self.popupViewConfig.roundCornerButtonHeight) / 2.0, contentContainerSize.width - self.popupViewConfig.roundCornerButtonMargin * 2, self.popupViewConfig.roundCornerButtonHeight);
            leftButton.backgroundColor = self.popupViewConfig.roundCornerConfirmButtonBackgroundColor;
            leftButton.layer.cornerRadius = self.popupViewConfig.roundCornerButtonCornerRadius;
            leftButton.titleLabel.font = self.popupViewConfig.roundCornerButtonFont;
            [leftButton setTitleColor:self.popupViewConfig.roundCornerConfirmButtonTitleColor forState:UIControlStateNormal];
            [leftButton setTitle:[self.buttons objectAtIndex:0] forState:UIControlStateNormal];
            [buttonBackgroundView addSubview:leftButton];
            [_dialogView addSubview:buttonBackgroundView];
        }
        if (self.buttons.count == 2) {
            leftButton.frame = CGRectMake(self.popupViewConfig.roundCornerButtonMargin, (self.popupViewConfig.roundCornerButtonBackgroundViewHeight - self.popupViewConfig.roundCornerButtonHeight) / 2.0, (contentContainerSize.width - self.popupViewConfig.roundCornerButtonMargin * 2 - self.popupViewConfig.roundCornerButtonMiddleMargin) / 2.0, self.popupViewConfig.roundCornerButtonHeight);
            leftButton.layer.cornerRadius = self.popupViewConfig.roundCornerButtonCornerRadius;
            leftButton.titleLabel.font = self.popupViewConfig.roundCornerButtonFont;
            [leftButton setTitleColor:self.popupViewConfig.roundCornerCancelButtonTitleColor forState:UIControlStateNormal];
            [leftButton setTitle:[self.buttons objectAtIndex:0] forState:UIControlStateNormal];
            leftButton.layer.borderWidth = self.popupViewConfig.roundCornerCancelButtonBorderWidth;
            leftButton.layer.borderColor = self.popupViewConfig.roundCornerCancelButtonBorderColor.CGColor;
            [buttonBackgroundView addSubview:leftButton];
            [_dialogView addSubview:buttonBackgroundView];
            
            rightButton.frame = CGRectMake(CGRectGetMaxX(leftButton.frame) + self.popupViewConfig.roundCornerButtonMiddleMargin, (self.popupViewConfig.roundCornerButtonBackgroundViewHeight - self.popupViewConfig.roundCornerButtonHeight) / 2.0, (contentContainerSize.width - self.popupViewConfig.roundCornerButtonMargin * 2 - self.popupViewConfig.roundCornerButtonMiddleMargin) / 2.0, self.popupViewConfig.roundCornerButtonHeight);
            rightButton.backgroundColor = self.popupViewConfig.roundCornerConfirmButtonBackgroundColor;
            rightButton.layer.cornerRadius = self.popupViewConfig.roundCornerButtonCornerRadius;
            rightButton.titleLabel.font = self.popupViewConfig.roundCornerButtonFont;
            [rightButton setTitleColor:self.popupViewConfig.roundCornerConfirmButtonTitleColor forState:UIControlStateNormal];
            [rightButton setTitle:[self.buttons objectAtIndex:1] forState:UIControlStateNormal];
            [buttonBackgroundView addSubview:rightButton];
            [_dialogView addSubview:buttonBackgroundView];
        }
    } else {
        UIView *buttonBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, contentContainerSize.height, contentContainerSize.width, self.popupViewConfig.shapelessButtonHeight + self.popupViewConfig.shapelessSeparatorHeight)];
        UIView *horizontalSeparator = [[UIView alloc] initWithFrame:CGRectMake(self.popupViewConfig.shapelessHorizontalSeparatorMargin, 0, contentContainerSize.width - self.popupViewConfig.shapelessHorizontalSeparatorMargin * 2, self.popupViewConfig.shapelessSeparatorHeight)];
        horizontalSeparator.backgroundColor = self.popupViewConfig.shapelessSeparatorBackgroundColor;
        [buttonBackgroundView addSubview:horizontalSeparator];
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.tag = 0;
        [leftButton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.tag = 1;
        [rightButton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        if (self.buttons.count == 1) {
            leftButton.frame = CGRectMake(0, self.popupViewConfig.shapelessSeparatorHeight, contentContainerSize.width, self.popupViewConfig.shapelessButtonHeight);
            leftButton.backgroundColor = self.popupViewConfig.dialogBackgroundColor;
            leftButton.titleLabel.font = self.popupViewConfig.shapelessButtonFont;
            [leftButton setTitleColor:self.popupViewConfig.shapelessConfirmButtonTitleColor forState:UIControlStateNormal];
            [leftButton setTitle:[self.buttons objectAtIndex:0] forState:UIControlStateNormal];
            [buttonBackgroundView addSubview:leftButton];
            [_dialogView addSubview:buttonBackgroundView];
        }
        if (self.buttons.count == 2) {
            leftButton.frame = CGRectMake(0, self.popupViewConfig.shapelessSeparatorHeight, contentContainerSize.width / 2.0, self.popupViewConfig.shapelessButtonHeight);
            leftButton.backgroundColor = self.popupViewConfig.dialogBackgroundColor;
            leftButton.titleLabel.font = self.popupViewConfig.shapelessButtonFont;
            [leftButton setTitleColor:self.popupViewConfig.shapelessCancelButtonTitleColor forState:UIControlStateNormal];
            [leftButton setTitle:[self.buttons objectAtIndex:0] forState:UIControlStateNormal];
            [buttonBackgroundView addSubview:leftButton];
            [_dialogView addSubview:buttonBackgroundView];
            
            rightButton.frame = CGRectMake(CGRectGetMaxX(leftButton.frame), self.popupViewConfig.shapelessSeparatorHeight, contentContainerSize.width / 2.0, self.popupViewConfig.shapelessButtonHeight);
            rightButton.backgroundColor = self.popupViewConfig.dialogBackgroundColor;
            rightButton.titleLabel.font = self.popupViewConfig.shapelessButtonFont;
            [rightButton setTitleColor:self.popupViewConfig.shapelessConfirmButtonTitleColor forState:UIControlStateNormal];
            [rightButton setTitle:[self.buttons objectAtIndex:1] forState:UIControlStateNormal];
            [buttonBackgroundView addSubview:rightButton];
            [_dialogView addSubview:buttonBackgroundView];
            
            UIView *verticalSeparator = [[UIView alloc] initWithFrame:CGRectMake((contentContainerSize.width - self.popupViewConfig.shapelessSeparatorHeight) / 2.0, self.popupViewConfig.shapelessSeparatorHeight + self.popupViewConfig.shapelessVerticalSeparatorMargin, self.popupViewConfig.shapelessSeparatorHeight, self.popupViewConfig.shapelessButtonHeight - self.popupViewConfig.shapelessVerticalSeparatorMargin * 2)];
            verticalSeparator.backgroundColor = self.popupViewConfig.shapelessSeparatorBackgroundColor;
            [buttonBackgroundView addSubview:verticalSeparator];
        }
    }
}

- (void)applyMotionEffects {
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return;
    }
    
    UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalEffect.minimumRelativeValue = @(-self.popupViewConfig.motionEffectExtent);
    horizontalEffect.maximumRelativeValue = @(self.popupViewConfig.motionEffectExtent);
    
    UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalEffect.minimumRelativeValue = @(-self.popupViewConfig.motionEffectExtent);
    verticalEffect.maximumRelativeValue = @(self.popupViewConfig.motionEffectExtent);
    
    UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
    motionEffectGroup.motionEffects = @[horizontalEffect, verticalEffect];
    
    [_dialogView addMotionEffect:motionEffectGroup];
}

- (UIView *)createDialogView {
    UIView *dialogView = [[UIView alloc] init];
    dialogView.backgroundColor = self.popupViewConfig.dialogBackgroundColor;
    dialogView.layer.cornerRadius = self.popupViewConfig.dialogCornerRadius;
    dialogView.clipsToBounds = YES;
    return dialogView;
}

- (CGSize)dialogViewSize {
    CGSize contentContainerSize = [self contentContainerSize];
    if (self.buttonType == YQQPopupViewButtonTypeRoundCorner) {
        return CGSizeMake(contentContainerSize.width, contentContainerSize.height + self.popupViewConfig.roundCornerButtonBackgroundViewHeight);
    } else {
        return CGSizeMake(contentContainerSize.width, contentContainerSize.height + self.popupViewConfig.shapelessButtonHeight + self.popupViewConfig.shapelessSeparatorHeight);
    }
}

- (CGSize)attachedViewSize {
    return _attachedView.bounds.size;
}

- (CGSize)contentContainerSize {
    return _contentContainer.frame.size;
}

#pragma mark - Public

- (void)show {
    [self showInView:_attachedView];
}

- (void)showInView:(UIView *)superView {
    _attachedView = superView;
    
    _contentContainer = [self fetchContentContainer];
    _dialogView = [self createDialogView];
    
    CGSize dialogViewSize = [self dialogViewSize];
    CGSize attachedViewSize = [self attachedViewSize];
    CGSize keyboardSize = CGSizeMake(0, 0);
    
    _dialogView.frame = CGRectMake((attachedViewSize.width - dialogViewSize.width) / 2.0, (attachedViewSize.height - keyboardSize.height - dialogViewSize.height) / 2.0, dialogViewSize.width, dialogViewSize.height);
    if (_useMotionEffects) {
        [self applyMotionEffects];
    }
    
    [self addButtons];
    [_dialogView addSubview:_contentContainer];
    [self addSubview:_dialogView];
    self.frame = _attachedView.bounds;
    [_attachedView addSubview:self];
    
    _dialogView.layer.opacity = 0.5f;
    _dialogView.layer.transform = CATransform3DMakeScale(1.3f, 1.3f, 1.0);
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
                         self.dialogView.layer.opacity = 1.0f;
                         self.dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
                     }completion:^(BOOL finished) {
                         
                     }
     ];
}

- (void)close {
    CATransform3D currentTransform = _dialogView.layer.transform;
    
    _dialogView.layer.opacity = 1.0f;
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
                         self.dialogView.layer.transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(0.6f, 0.6f, 1.0));
                         self.dialogView.layer.opacity = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         for (UIView *v in [self subviews]) {
                             [v removeFromSuperview];
                         }
                         [self removeFromSuperview];
                     }
     ];
}

+ (void)hideAllPopupView {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hideAllPopupView" object:nil userInfo:nil];
}

#pragma mark - Notification

- (void)deviceOrientationDidChange: (NSNotification *)notification {
    
}

- (void)keyboardWillShow: (NSNotification *)notification {
    CGSize dialogViewSize = [self dialogViewSize];
    CGSize attachedViewSize = [self attachedViewSize];
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         self.dialogView.frame = CGRectMake((attachedViewSize.width - dialogViewSize.width) / 2, (attachedViewSize.height - keyboardSize.height - dialogViewSize.height) / 2, dialogViewSize.width, dialogViewSize.height);
                     } completion:^(BOOL finished) {
                         
                     }
     ];
}

- (void)keyboardWillHide: (NSNotification *)notification {
    CGSize dialogViewSize = [self dialogViewSize];
    CGSize attachedViewSize = [self attachedViewSize];
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         self.dialogView.frame = CGRectMake((attachedViewSize.width - dialogViewSize.width) / 2, (attachedViewSize.height - dialogViewSize.height) / 2, dialogViewSize.width, dialogViewSize.height);
                     }completion:^(BOOL finished) {
                         
                     }
     ];
}

#pragma mark - Action

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!_closeOnTouchUpOutside) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    if ([touch.view isKindOfClass:[self class]]) {
        [self close];
    }
}

- (void)clicked:(UIButton *)sender {
    [self dialogButtonDidClickWithIndex:sender.tag];
}

#pragma mark - Subclass Override

- (UIView *)fetchContentContainer {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    [view addSubview:text];
    return view;
}

- (void)dialogButtonDidClickWithIndex:(NSInteger)index {
    
}

@end
