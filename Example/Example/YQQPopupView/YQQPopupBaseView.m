//
//  YQQPopupBaseView.m
//  Example
//
//  Created by zhuyi on 2020/10/28.
//

#import "YQQPopupBaseView.h"
#import "YQQPopupButtonItem.h"

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
        
        _useMotionEffects = NO;
        _closeOnTouchUpOutside = YES;
        _separatorHeight = 1;
        _buttonContainerHeight = 54;
        _motionEffectExtent = 10;
        _attachedView = [UIApplication sharedApplication].delegate.window;
        _itemArray = [self fetchItemArray];
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%@♻️♻️", NSStringFromClass([self class]));
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

#pragma mark - Private

- (void)applyMotionEffects {
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return;
    }
    
    UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalEffect.minimumRelativeValue = @(-_motionEffectExtent);
    horizontalEffect.maximumRelativeValue = @(_motionEffectExtent);
    
    UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalEffect.minimumRelativeValue = @(-_motionEffectExtent);
    verticalEffect.maximumRelativeValue = @( _motionEffectExtent);
    
    UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
    motionEffectGroup.motionEffects = @[horizontalEffect, verticalEffect];
    
    [_dialogView addMotionEffect:motionEffectGroup];
}

- (UIView *)createDialogView {
    UIView *dialogView = [[UIView alloc] init];
    dialogView.backgroundColor = [UIColor purpleColor];
    return dialogView;
}

- (CGSize)dialogViewSize {
    return CGSizeMake(_contentContainer.frame.size.width, _contentContainer.frame.size.height + _buttonContainerHeight + _separatorHeight);
}

- (CGSize)attachedViewSize {
    return _attachedView.bounds.size;
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

#pragma mark - Subclass Override

- (NSArray<YQQPopupButtonItem *> *)fetchItemArray {
    YQQPopupButtonItem *item = [[YQQPopupButtonItem alloc] init];
    item.title = @"close";
    return @[item];
}

- (UIView *)fetchContentContainer {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    [view addSubview:text];
    view.backgroundColor = [UIColor orangeColor];
    return view;
}

@end
