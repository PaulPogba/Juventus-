//
//  AJBInsuranceTagView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/14.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBInsuranceTagView.h"

@implementation AJBInsuranceTagView

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void) refreshTagArray:(NSArray *)array
{
    for (int i = 0; i < array.count; i ++)
    {
        NSString *name = array[i];
        static UIButton *recordBtn =nil;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        CGRect rect = [name boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 20, 30) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:FONT_OF_SIZE_13} context:nil];
        
        CGFloat BtnW = rect.size.width + 20;
        CGFloat BtnH = rect.size.height + 10;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 5;
        if (i == 0)
        {
            btn.frame =CGRectMake(10, 10, BtnW, BtnH);
        }
        else{
            //剩余多少宽度
            CGFloat yuWidth = SCREEN_WIDTH - 20 - recordBtn.frame.origin.x -recordBtn.frame.size.width;
            
            if (yuWidth >= rect.size.width) {
                btn.hidden = NO;
                //判断剩余的宽度是否大于按钮的宽度
                btn.frame =CGRectMake(recordBtn.frame.origin.x +recordBtn.frame.size.width + 10, recordBtn.frame.origin.y, BtnW, BtnH);
            } else{
                btn.hidden = YES;
                btn.frame =CGRectMake(recordBtn.frame.origin.x +recordBtn.frame.size.width,recordBtn.frame.origin.y, 0, 0);
            }
        }
        btn.backgroundColor = COLOR_UI_f1f1f1;
        [btn setTitle:name forState:UIControlStateNormal];
        [self addSubview:btn];
        recordBtn = btn;
        
        btn.tag = 100 + i;
    }
}


@end
