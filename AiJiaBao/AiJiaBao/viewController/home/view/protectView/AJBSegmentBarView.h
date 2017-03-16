//
//  AJBProtectBarView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/3.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AJBSegmentBarViewDelegate <NSObject>

- (void) switchButtonWithIndex:(NSInteger) index;

@end

@interface AJBSegmentBarView : UIView

@property (nonatomic, assign) id<AJBSegmentBarViewDelegate> delegate;


- (id) initWithCount:(CGFloat)count hiddenLine:(BOOL) hiddeLine;

- (void)refresh:(NSArray *) array;

- (void) setSelectIndex:(NSInteger) index;

@end
