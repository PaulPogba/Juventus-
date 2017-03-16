//
//  AJBBaseHttpViewController.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/15.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBBaseViewController.h"

@interface AJBBaseHttpViewController : AJBBaseViewController

@property (nonatomic, strong) NSString *pageTitle;
@property (nonatomic, strong) NSString *pageURL;

- (id) initWithTitle: (NSString *) pageTitle url: (NSString *) pageURL;

@end
