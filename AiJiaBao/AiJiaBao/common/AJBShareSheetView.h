//
//  AJBShareSheetView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/9.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBPopoverView.h"

@interface AJBShareSheetView : AJBPopoverView

+ (AJBShareSheetView *)shareArticleTitle: (NSString *) title desc:(NSString *) desc icon: (NSString *) icon url: (NSString *) url;

@end
