//
//  ViewController.m
//  Example
//
//  Created by zhuyi on 2020/10/28.
//

#import "ViewController.h"
#import "YQQPopupBaseView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YQQPopupBaseView *popupView = [[YQQPopupBaseView alloc] init];
    [popupView show];
}

@end
