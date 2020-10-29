//
//  YQQCustomPopupView.m
//  Example
//
//  Created by zhuyi on 2020/10/29.
//

#import "YQQCustomPopupView.h"
#import "UIColor+YQQAdd.h"

@interface YQQCustomPopupView () <YQQPopupBaseViewDelegate>

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) SelectIndex selectIndex;

@end

@implementation YQQCustomPopupView

+ (instancetype)popupViewWithIimage:(UIImage *)image
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                       selectIndex:(SelectIndex)selectIndex {
    return [[self alloc] initWithImage:image buttonTitles:buttonTitles selectIndex:selectIndex];
}

- (instancetype)initWithImage:(UIImage *)image buttonTitles:(NSArray *)buttonTitles selectIndex:(SelectIndex)selectIndex {
    self = [super init];
    if (self) {
        _image = image;
        self.buttons = buttonTitles;
        _selectIndex = selectIndex;
        self.delegate = self;
    }
    return self;
}

- (UIView *)fetchContentContainer {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = self.image;
    return imageView;
}

#pragma mark - YQQPopupBaseViewDelegate

- (void)popupView:(YQQPopupBaseView *)popupView didSelectIndex:(NSInteger)index {
    if (self.selectIndex) {
        self.selectIndex(index, nil);
    }
    [self close];
}

@end
