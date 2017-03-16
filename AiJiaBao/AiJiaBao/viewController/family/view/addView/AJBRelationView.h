//
//  AJBRelationView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//
/*关系
 
 */
#import "AJBAddView.h"

@protocol AJBRelationViewDelegate <NSObject>

- (void) showRelationView;

@end


@interface AJBRelationView : AJBAddView

@property (nonatomic, assign) id<AJBRelationViewDelegate> delegate;

@end
