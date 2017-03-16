//
//  AJBRegisterSecondView.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AJBRegisterSecondViewDelegate <NSObject>

- (void) secondNextAction:(UIButton *)sender;

@end

@interface AJBRegisterSecondView : UIView

@property (nonatomic, assign) id<AJBRegisterSecondViewDelegate>delegate;

@property (nonatomic, strong) NSString *code;

- (void) refreshPhoneLabel:(NSString *)string;

@end
