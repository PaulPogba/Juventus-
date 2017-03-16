//
//  AJBFindSecretFirstView.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/23.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AJBFindSecretViewDelegate <NSObject>

- (void) findSecretFirstNextAction:(UIButton *)sender;

@end

@interface AJBFindSecretFirstView : UIView

@property (nonatomic, assign) id<AJBFindSecretViewDelegate>delegate;
@property (nonatomic, strong) NSString *phoneString;

@end




