//
//  AJBDiscoverTableViewCell.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/24.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJBDiscoverTableViewCell : UITableViewCell

+ (NSString *) reuseIdentifier;
- (void) refreshWithIcon:(NSString *)image title:(NSString *) title hiddenLine:(BOOL)hiddenLine;

@end
