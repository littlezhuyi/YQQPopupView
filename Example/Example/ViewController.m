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
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情"];
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情" buttonTitles:@[@"cancel"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情" buttonTitles:@[@"cancel", @"ok"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"" placeholder:@"请输入" buttonTitles:@[@"cancel", @"ok"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"" placeholder:@"请输入" inputType:YQQPopupViewInputTypeTextView buttonTitles:@[@"cancel", @"ok"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情" buttonType:YQQPopupViewButtonTypeShapeless];
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情" buttonTitles:@[@"cancel", @"ok"] buttonType:YQQPopupViewButtonTypeShapeless selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"" placeholder:@"请输入" buttonTitles:@[@"cancel", @"ok"] buttonType:YQQPopupViewButtonTypeShapeless selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"" placeholder:@"请输入" inputType:YQQPopupViewInputTypeTextView buttonTitles:@[@"cancel", @"ok"] buttonType:YQQPopupViewButtonTypeShapeless selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
    YQQPopupView *popupView;
    popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"" inputType:YQQPopupViewInputTypeTextView placeholder:@"请输入" buttonType:YQQPopupViewButtonTypeRoundCorner buttonTitles:@[@"cancel", @"ok"] textViewMaxLength:50 selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
        NSLog(@"%@", inputContent);
    }];
    [popupView show];
    
//    YQQCustomPopupView *customeView = [YQQCustomPopupView popupViewWithIimage:[UIImage imageNamed:@"PA_UserVerify_wrongId"] buttonTitles:@[@"cancel", @"ok"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
//
//    }];
//    [customeView show];
}

@end
