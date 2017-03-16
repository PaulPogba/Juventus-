//
//  AJBFriendsCell.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJBFriendsCell : UITableViewCell

+ (NSString *) reuseIdentifier;

- (void) refreshTitle:(NSString *) title;
@end
