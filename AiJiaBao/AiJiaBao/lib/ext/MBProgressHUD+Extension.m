//
//  MBProgressHUD+Extension.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/14.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//


#import "MBProgressHUD+Extension.h"
#import "AppDelegate.h"

@implementation MBProgressHUD (Extension)

+ (MBProgressHUD *) showInWindow
{
    AppDelegate *dlg = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return [MBProgressHUD showHUDAddedTo:dlg.window animated:YES];
    
}

+ (BOOL) hideForWindow
{
    AppDelegate *dlg = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return [MBProgressHUD hideHUDForView:dlg.window animated:YES];
}

//============
+ (MBProgressHUD *) showSuccess: (NSString *) text inView: (UIView *) view
{
    return [MBProgressHUD showInView:view type:HUDTypeSuccess text:nil detail:text color:[[UIColor blackColor] colorWithAlphaComponent:0.3]];
}
+ (MBProgressHUD *) showError: (NSString *) text inView: (UIView *) view
{
    return [MBProgressHUD showInView:view type:HUDTypeError text:nil detail:text color:[[UIColor blackColor] colorWithAlphaComponent:0.3]];
}
+ (MBProgressHUD *) showPrompt: (NSString *) text inView: (UIView *) view
{
    return [MBProgressHUD showInView:view type:HUDTypePrpmpt text:nil detail:text color:[[UIColor blackColor] colorWithAlphaComponent:0.3]];
}

+ (MBProgressHUD *) showWifiError: (NSString *) text inView: (UIView *) view
{
    return [MBProgressHUD showInView:view type:HUDTypeWifiError text:nil detail:text color:[[UIColor blackColor] colorWithAlphaComponent:0.3]];
}

+ (MBProgressHUD *) showWifiText: (NSString *) text inView: (UIView *) view
{
    return [MBProgressHUD showInView:view type:HUDTypeOnlyText text:nil detail:text color:[[UIColor blackColor] colorWithAlphaComponent:0.3]];
}


//============
+ (void) toastLoading: (NSString *) text inView: (UIView *) view delay: (NSTimeInterval) delay
{
    return [[MBProgressHUD showInView:view type:HUDTypeAnim text:text detail:nil color:[[UIColor blackColor] colorWithAlphaComponent:0.5]] hideAnimated:YES afterDelay:delay ];
}

+ (void) toastSuccess: (NSString *) text inView: (UIView *) view
{
    [[MBProgressHUD showSuccess:text inView:view] hideAnimated:YES afterDelay:2];
}
+ (void) toastError: (NSString *) text inView: (UIView *) view
{
    [[MBProgressHUD showError:text inView:view] hideAnimated:YES afterDelay:2];
}
+ (void) toastPrompt: (NSString *) text inView: (UIView *) view
{
    [[MBProgressHUD showPrompt:text inView:view] hideAnimated:YES afterDelay:3];
}
+(void)toastWifiError :(NSString *) text inView: (UIView *) view
{
    [[MBProgressHUD showWifiError:text inView:view] hideAnimated:YES afterDelay:3];
}
+(void)toastText :(NSString *) text inView: (UIView *) view
{
    [[MBProgressHUD showWifiText:text inView:view] hideAnimated:YES afterDelay:3];
}


//============   show in window
+ (void) toastSuccess: (NSString *) text
{
    AppDelegate *dlg = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MBProgressHUD toastSuccess:text inView:dlg.window];
}

+ (void) toastError: (NSString *) text
{
    AppDelegate *dlg = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MBProgressHUD toastError:text inView:dlg.window];
}

+ (void) toastPrompt: (NSString *) text
{
    AppDelegate *dlg = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MBProgressHUD toastPrompt:text inView:dlg.window];
}

+ (void) toastWifiError: (NSString *) text
{
    AppDelegate *dlg = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MBProgressHUD toastWifiError:text inView:dlg.window];
}

+ (void) toastText: (NSString *) text
{
    AppDelegate *dlg = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MBProgressHUD toastText:text inView:dlg.window];
}

//=========   初始化hud
+ (MBProgressHUD *) showInView: (UIView *) view type: (HUDType) type text: (NSString *) text detail: (NSString *) detail color:(UIColor *) color
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    hud.bezelView.color = color;
    hud.activityIndicatorColor = COLOR_UI_54C1F5;
    [hud setType:type];
    hud.label.text = text;
    hud.detailsLabel.text = detail;
    hud.detailsLabel.textColor = [UIColor whiteColor];
    [hud showAnimated:YES];
    
    return hud;
//    color is deprecated : customize the bezelView color instead 
}

// 在View 层展示
+ (MBProgressHUD *) showInView: (UIView *) view text: (NSString *) text
{
//    return [MBProgressHUD showInView:view type:HUDTypeAnim text:text detail:nil];
    return [MBProgressHUD showInView:view type:HUDTypeIndeterminate text:text detail:nil color:[UIColor clearColor]];
}

// 默认 text
+ (MBProgressHUD *) showDataSubmitInView: (UIView *) view
{
    return [MBProgressHUD showInView:view type:HUDTypeAnim text:@"数据提交中" detail:nil color:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
}


// 设置 hud 类型
- (MBProgressHUD *) setType: (HUDType) type
{
    switch (type) {
        case HUDTypeOnlyText:
        {
            self.mode = MBProgressHUDModeText;
            break;
        } case HUDTypeIndeterminate:
        {
            self.mode = MBProgressHUDModeIndeterminate;
            break;
        }
        case HUDTypeAnim:
        {
            UIImageView *imgView = [self customImageView];
            NSMutableArray *anims = [NSMutableArray array];
            for (int i=0; i<5; i++)
            {
                NSString *name = [NSString stringWithFormat:@"loading_%d", i];
                UIImage *img =imageNamed(name);
                [anims addObject:img];
            }
            imgView.size = ((UIImage *)[anims objectAtIndex:0]).size;
            imgView.animationDuration = 0.35;
            imgView.animationImages = anims;
            imgView.animationRepeatCount = 0;
            [imgView startAnimating];
            break;
        }
        case HUDTypeSuccess:
        {
            UIImageView *imgView = [self customImageView];
            imgView.image =imageNamed(@"alert_success");
            imgView.size = imgView.image.size;
            break;
        }
        case HUDTypeError:
        {
            UIImageView *imgView = [self customImageView];
            imgView.image = imageNamed(@"alert_error");
            imgView.size = imgView.image.size;
            break;
        }
        case HUDTypePrpmpt:
        {
            UIImageView *imgView = [self customImageView];
            imgView.image = imageNamed(@"alert_prompt");
            imgView.size = imgView.image.size;
            break;
        }
        case HUDTypeWifiError:
        {
            UIImageView *imgView = [self customImageView];
            imgView.image = imageNamed(@"alert_wifiError");
            imgView.size = imgView.image.size;
            break;
        }

        default:
            break;
    }
    
    
    return self;
}

- (UIImageView *) customImageView
{
    UIImageView *imgView = nil;
    if (self.customView != nil && [self.customView isKindOfClass:[UIImageView class]])
    {
        imgView = (UIImageView *)self.customView;
        [imgView stopAnimating];
    }else
    {
        imgView = [[UIImageView alloc] init];
        self.customView = imgView;
    }
    self.mode = MBProgressHUDModeCustomView;

    return imgView;
}


- (void) hideWithText: (NSString *) text type: (HUDType) type animated:(BOOL)animated afterDelay:(NSTimeInterval)delay
{
    [self setType:type];
    self.label.text = text;
    
    [self hideAnimated:animated afterDelay:delay];
}

- (void) hideWithError: (NSString *) text
{
    [self hideWithText:text type:HUDTypeError animated:YES afterDelay:1];
}

@end
