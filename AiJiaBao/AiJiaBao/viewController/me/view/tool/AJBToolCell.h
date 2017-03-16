//
//  AJBToolCell.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/9.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJBToolCell : UICollectionViewCell

- (void) refreshWithImage:(NSString *)image title:(NSString *) title;
+ (NSString *) reuseIdentifier;

@end
