//  AJBTablePlaceholderView.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/23.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJBTablePlaceholderView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

- (void) refreshWithImage:(NSString *)image title:(NSString *)title detail:(NSString *)detail;

@end
