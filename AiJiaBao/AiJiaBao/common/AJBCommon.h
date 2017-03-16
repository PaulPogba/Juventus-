//
//  AJBCommon.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJBCommon : NSObject

+ (BOOL)isMobileNumber:(NSString *)mobileNum;
+ (CAGradientLayer *) gradientLayerWithHeight:(CGFloat)height;

-(void) pushViewController:(UIViewController *)vc animated:(BOOL)animated;

@end
