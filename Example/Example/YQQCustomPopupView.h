//
//  YQQCustomPopupView.h
//  Example
//
//  Created by zhuyi on 2020/10/29.
//

#import "YQQPopupBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YQQCustomPopupView : YQQPopupBaseView

+ (instancetype)popupViewWithIimage:(UIImage *)image
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                       selectIndex:(SelectIndex)selectIndex;

- (instancetype)initWithImage:(UIImage *)image
                 buttonTitles:(NSArray *_Nullable)buttonTitles
                  selectIndex:(SelectIndex)selectIndex;

@end

NS_ASSUME_NONNULL_END
