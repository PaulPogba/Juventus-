//
//  AJBRegisterFirstView.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AJBRegisterFirstViewDelegate <NSObject>

- (void) firstNextAction:(UIButton *)sender;

@end


@interface AJBRegisterFirstView : UIView

@property (nonatomic, assign) id<AJBRegisterFirstViewDelegate>delegate;
@property (nonatomic, strong) NSString *phoneString;

@end
