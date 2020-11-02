//
//  YQQPopupView.h
//  Example
//
//  Created by zhuyi on 2020/10/29.
//

#import "YQQPopupBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YQQPopupView : YQQPopupBaseView

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail;

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                       selectIndex:(SelectIndex _Nullable)selectIndex;

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                       placeholder:(NSString *_Nullable)placeholder
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                       selectIndex:(SelectIndex _Nullable)selectIndex;

+ (instancetype)popupViewWithTitle:(NSString *_Nullable)title
                            detail:(NSString *_Nullable)detail
                       placeholder:(NSString *_Nullable)placeholder
                         inputType:(YQQPopupViewInputType)inputType
                      buttonTitles:(NSArray *_Nullable)buttonTitles
                        buttonType:(YQQPopupViewButtonType)buttonType
                       selectIndex:(SelectIndex _Nullable)selectIndex;

- (instancetype)initWithTitle:(NSString *_Nullable)title
                       detail:(NSString *_Nullable)detail
                  placeholder:(NSString *_Nullable)placeholder
                    inputType:(YQQPopupViewInputType)inputType
                 buttonTitles:(NSArray *_Nullable)buttonTitles
                   buttonType:(YQQPopupViewButtonType)buttonType
                  selectIndex:(SelectIndex _Nullable)selectIndex;

@end

NS_ASSUME_NONNULL_END
