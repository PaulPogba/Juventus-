//
//  AJBRegisterThreeView.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AJBRegisterThreeViewDelegate <NSObject>

- (void) threeNextAction:(UIButton *)sender;

@end

@interface AJBRegisterThreeView : UIView
@property (nonatomic, assign) id<AJBRegisterThreeViewDelegate>delegate;

- (void) refreshPhoneLabel:(NSString *)phone code:(NSString *)code;

@end
