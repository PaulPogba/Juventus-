//
//  AJBBirthdayPickerView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

/*
    生日弹窗
 */
#import <UIKit/UIKit.h>
typedef void(^BirthdayPickerBlock) (NSString* day);
@interface AJBBirthdayPickerView : UIView
@property (nonatomic ,copy)BirthdayPickerBlock blcok;
- (void) showPickerView;

@end
