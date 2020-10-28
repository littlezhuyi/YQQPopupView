//
//  YQQPopupBaseView.m
//  Example
//
//  Created by zhuyi on 2020/10/28.
//

#import "YQQPopupBaseView.h"
#import "YQQPopupButtonItem.h"

@interface YQQPopupBaseView ()

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
        _itemArray = [self fetchItemArray];
        
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%@♻️♻️", NSStringFromClass([self class]));
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

#pragma mark - Public

- (void)show {
    [self showInView:[UIApplication sharedApplication].delegate.window];
}

- (void)showInView:(UIView *)superView {
    
}

- (void)close {
    
}

#pragma mark - Notification

- (void)deviceOrientationDidChange: (NSNotification *)notification {
    
}

- (void)keyboardWillShow: (NSNotification *)notification {
    
}

- (void)keyboardWillHide: (NSNotification *)notification {
    
}

#pragma mark - SubClass

- (NSArray<YQQPopupButtonItem *> *)fetchItemArray {
    YQQPopupButtonItem *item = [[YQQPopupButtonItem alloc] init];
    item.title = @"close";
    return @[item];
}

- (UIView *)fetchContentContainer {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    return view;
}

@end
