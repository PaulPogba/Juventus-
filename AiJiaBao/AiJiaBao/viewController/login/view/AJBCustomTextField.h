//
//  AJBCustomTextField.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/23.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CustomTextFieldType) {
    CustomTextFieldType_PHONE = 0,
    CustomTextFieldType_CODE = 1,
    CustomTextFieldType_SECRET = 2,
};


@interface AJBCustomTextField : UIView

@property (nonatomic, copy) void(^notification)(NSString * text);

@property (nonatomic, strong) UITextField *textField;

- (id) initWithtextFieldPlaceholder :(NSString *) placeholder image:(NSString *)image notification:(void (^)(NSString *text)) notification type:(CustomTextFieldType) type;

@end
