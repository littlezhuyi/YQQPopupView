//
//  ViewController.m
//  Example
//
//  Created by zhuyi on 2020/10/28.
//

#import "ViewController.h"
#import "YQQPopupView.h"
#import "YQQCustomPopupView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YQQPopupView *popupView;
    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情"];
    popupView.useMotionEffects = YES;
    popupView.closeOnTouchUpOutside = NO;
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情" buttonTitles:@[@"cancel"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情" placeholder:@"请输入" buttonTitles:@[@"cancel", @"ok"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情" placeholder:@"请输入" inputType:YQQPopupViewInputTypeTextField buttonTitles:@[@"cancel", @"ok"] buttonType:YQQPopupViewButtonTypeShapeless selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    popupView = [[YQQPopupView alloc] initWithTitle:@"这是title" detail:@"这是详情" placeholder:@"请输入" inputType:YQQPopupViewInputTypeTextView buttonTitles:@[@"cancel", @"ok"] buttonType:YQQPopupViewButtonTypeRoundCorner selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
    [popupView show];
    
//    YQQCustomPopupView *customeView = [YQQCustomPopupView popupViewWithIimage:[UIImage imageNamed:@"404"] buttonTitles:@[@"cancel", @"ok"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    [customeView show];
}

@end
