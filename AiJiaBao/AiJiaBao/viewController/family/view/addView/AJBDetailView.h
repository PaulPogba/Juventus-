//
//  AJBDetailView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//
/*
 身份信息下半部
 */
#import <UIKit/UIKit.h>
#import "AJBDetailEnterView.h"

@protocol AJBDetailViewDelegate <NSObject>

-(void)textFieldBeginEdit:(id)view;

@end


@interface AJBDetailView : UIView

@property (nonatomic, assign) id<AJBDetailViewDelegate>delegate;

@property (nonatomic, strong) AJBDetailEnterView *phoneView;
@property (nonatomic, strong) AJBDetailEnterView *emailView;

@end
