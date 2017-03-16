//
//  AJBSettingCell.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/10.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJBSettingCell : UITableViewCell

- (void) refreshWithTitle:(NSString *) title;

+ (NSString *) reuseIdentifier;

@end
