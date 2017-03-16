//
//  AJBCouponMoreView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/2.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AJBCouponMoreViewDelegate <NSObject>

- (void) showCouponMoreViewDelegate;

@end

@interface AJBCouponMoreView : UIView

//@property(nonatomic, copy) void(^showMoreBlock)(AJBCouponMoreView *view);

@property (nonatomic, assign) id <AJBCouponMoreViewDelegate> delegate;

-(void) refreshWithObj:(JSONCouponObj *)obj;

/**
 默认高度
 */
+ (CGFloat)defaultHeight:(JSONCouponObj *)obj;

/**
 展开高度
 */
+ (CGFloat)moreHeight:(JSONCouponObj *)obj;

@end
