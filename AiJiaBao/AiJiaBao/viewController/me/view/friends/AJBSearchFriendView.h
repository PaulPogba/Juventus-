//
//  AJBSearchFriendView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AJBSearchFriendViewDelegate <NSObject>

- (void) onSearchAction;

@end

@interface AJBSearchFriendView : UIView

@property (nonatomic, assign) id<AJBSearchFriendViewDelegate> delegate;

- (void) refresh:(NSString *) title;

- (void) hiddenPlaceholderView:(BOOL) hidden;


@end
