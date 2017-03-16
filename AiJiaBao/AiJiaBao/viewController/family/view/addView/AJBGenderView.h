//
//  AJBGenderView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//
/*
    性别
 */
#import "AJBAddView.h"

@protocol AJBGenderViewDelegate <NSObject>

- (void) showChooseGenderView;

@end

@interface AJBGenderView : AJBAddView

@property (nonatomic, assign) id<AJBGenderViewDelegate> delegate;

@end
