//
//  AJBCouponCell.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/1.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AJBCouponCellDelegate <NSObject>

- (void) showCouponCellDelegate:(UITableViewCell *)cell;

@end


@interface AJBCouponCell : UITableViewCell

@property (nonatomic, assign) id <AJBCouponCellDelegate> delegate;

- (void) refreshWithObj:(JSONCouponObj *) obj;

+ (CGFloat)defaultHeight:(JSONCouponObj *)obj;

+ (CGFloat)moreHeight:(JSONCouponObj *)obj;

+ (NSString *) reuseIdentifier;

@end
