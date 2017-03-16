//
//  AJBSDWebImageView.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/24.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJBSDWebImageView : UIImageView

@property (nonatomic, strong) UIColor *defaultBackgroundColor;
@property (nonatomic, assign) UIViewContentMode defaultViewContentMode;

@property (nonatomic, strong) NSString *imgURL;
@property (nonatomic, strong) UIImage *placeHolder;

- (id) initWithFrame:(CGRect)frame placeHolder: (UIImage *) placeHolder;

- (void) setImageURL: (NSString *) url;

- (void) setImageURL: (NSString *) url onComplete:(void (^)(UIImage *img))onComplete;

- (void) setBackgroundColor:(UIColor *)backgroundColor;
- (void) setBackgroundColor:(UIColor *)backgroundColor store: (BOOL) store;

- (void) setContentMode:(UIViewContentMode)contentMode;
- (void) setContentMode:(UIViewContentMode)contentMode store: (BOOL) store;

@end
