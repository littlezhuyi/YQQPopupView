# YQQPopupView
## 使用示例
### 使用方式一

```
YQQPopupView *popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情"];
[popupView show];
```
<img src="https://github.com/littlezhuyi/YQQExampleImages/blob/master/YQQPopupView/oneButton.png" width="621" height="500">

### 使用方式二

```
YQQPopupView *popupView = popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情" buttonTitles:@[@"cancel", @"ok"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
}];
[popupView show];
```

<img src="https://github.com/littlezhuyi/YQQExampleImages/blob/master/YQQPopupView/twoButton.png" width="621" height="500">

### 使用方式三

```
YQQPopupView *popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"" placeholder:@"请输入" buttonTitles:@[@"cancel", @"ok"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
}];
[popupView show];
```   

<img src="https://github.com/littlezhuyi/YQQExampleImages/blob/master/YQQPopupView/textField.png" width="621" height="500">

### 使用方式四

```
YQQPopupView *popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"" inputType:YQQPopupViewInputTypeTextView placeholder:@"请输入" buttonType:YQQPopupViewButtonTypeRoundCorner buttonTitles:@[@"cancel", @"ok"] textViewMaxLength:50 selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {
        NSLog(@"%@", inputContent);
}];
[popupView show];
``` 

<img src="https://github.com/littlezhuyi/YQQExampleImages/blob/master/YQQPopupView/textView.png" width="621" height="500">

### 使用方式五

```
YQQPopupView *popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"" placeholder:@"请输入" buttonTitles:@[@"cancel", @"ok"] buttonType:YQQPopupViewButtonTypeShapeless selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {

}];
[popupView show];
```

<img src="https://github.com/littlezhuyi/YQQExampleImages/blob/master/YQQPopupView/shaplessButton.png" width="621" height="500">

### 使用方式六

```
YQQCustomPopupView *customeView = [YQQCustomPopupView popupViewWithIimage:[UIImage imageNamed:@"404"] buttonTitles:@[@"cancel", @"ok"] selectIndex:^(NSInteger index, NSString * _Nullable inputContent) {

}];
[customeView show];
```

<img src="https://github.com/littlezhuyi/YQQExampleImages/blob/master/YQQPopupView/custom.png" width="621" height="500">

### 使用方式七

```
YQQPopupView *popupView = [YQQPopupView popupViewWithTitle:@"这是title" detail:@"这是详情"];
popupView.useMotionEffects = YES;
popupView.closeOnTouchUpOutside = NO;
[popupView show];
```

## 安装

### 手动

Clone代码，把YQQPopupView文件夹拖入项目，#import "YQQPopupView.h"，就可以使用了；

### CocoaPods

```ruby
target '<Your Target Name>' do
    pod 'YQQPopupView'
end
```

先执行`pod repo update`，再执行`pod install`

## 感谢

[UITextView-Placeholder](https://github.com/devxoul/UITextView-Placeholder)
