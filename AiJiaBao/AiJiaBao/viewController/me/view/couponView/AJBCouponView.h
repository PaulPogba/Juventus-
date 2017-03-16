//
//  AJBCouponView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/1.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol AJBCouponViewDelegate <NSObject>

- (void) showMoreDelegate;

@end


@interface AJBCouponView : UIView


@property (nonatomic, assign) id <AJBCouponViewDelegate> delegate;


/**
 刷新数据
 */
- (void) refreshWithObj:(JSONCouponObj *) obj;

/**
 默认高度
 */
+ (CGFloat)defaultHeight:(JSONCouponObj *)obj;

/**
 展开高度
 */
+ (CGFloat)moreHeight:(JSONCouponObj *)obj;

@end
