//
//  MBProgressHUD+Extension.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/14.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "MBProgressHUD.h"

typedef NS_ENUM(NSUInteger, HUDType) {
    HUDTypeOnlyText = 0,
    HUDTypeSuccess = 1,
    HUDTypeAnim = 2,
    HUDTypeError = 3,
    HUDTypePrpmpt = 4,
    HUDTypeWifiError = 5,
    HUDTypeIndeterminate,       //菊花
};

@interface MBProgressHUD (Extension)

+ (MBProgressHUD *) showInWindow;
+ (BOOL) hideForWindow;

+ (MBProgressHUD *) showSuccess: (NSString *) text inView: (UIView *) view;
+ (MBProgressHUD *) showError: (NSString *) text inView: (UIView *) view;
+ (MBProgressHUD *) showPrompt: (NSString *) text inView: (UIView *) view;

+ (void) toastLoading: (NSString *) text inView: (UIView *) view delay: (NSTimeInterval) delay;
+ (void) toastSuccess: (NSString *) text inView: (UIView *) view;
+ (void) toastError: (NSString *) text inView: (UIView *) view;
+ (void) toastPrompt: (NSString *) text inView: (UIView *) view;

+ (void) toastSuccess: (NSString *) text;
+ (void) toastError: (NSString *) text;
+ (void) toastPrompt: (NSString *) text;
+ (void) toastWifiError: (NSString *) text;
+ (void) toastText: (NSString *) text;

+ (MBProgressHUD *) showInView: (UIView *) view type: (HUDType) type text: (NSString *) text detail: (NSString *) detail color:(UIColor *) color;

+ (MBProgressHUD *) showInView: (UIView *) view text: (NSString *) text;
+ (MBProgressHUD *) showDataSubmitInView: (UIView *) view;


- (MBProgressHUD *) setType: (HUDType) type;
- (UIImageView *) customImageView;

- (void) hideWithText: (NSString *) text type: (HUDType) type animated:(BOOL)animated afterDelay:(NSTimeInterval)delay;

- (void) hideWithError: (NSString *) text;

@end
