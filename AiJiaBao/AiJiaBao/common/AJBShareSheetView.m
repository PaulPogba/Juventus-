//
//  AJBShareSheetView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/9.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBShareSheetView.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"

@interface AJBShareSheetView ()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *iconURL;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *url;

@end

@implementation AJBShareSheetView


- (instancetype)init
{
    __weak typeof(self) weakSelf = self;
    NSArray *array = @[@"微信",@"朋友圈",@"QQ好友",@"新浪微博",@"取消"];
    
    if (self = [super initWithOptions:array action:^(NSInteger idx) {
        [weakSelf actionSheet:idx];}])
    {
        
    }
    return self;
}

- (void) actionSheet:(NSInteger)idx
{
    /*
     
     UMSocialPlatformType_Predefine_Begin    = -1,
     UMSocialPlatformType_Sina               = 0, //新浪
     UMSocialPlatformType_WechatSession      = 1, //微信聊天
     UMSocialPlatformType_WechatTimeLine     = 2,//微信朋友圈
     UMSocialPlatformType_WechatFavorite     = 3,//微信收藏
     UMSocialPlatformType_QQ                 = 4,//QQ聊天页面
     UMSocialPlatformType_Qzone              = 5,//qq空间
     UMSocialPlatformType_TencentWb          = 6,//腾讯微博
     UMSocialPlatformType_AlipaySession      = 7,//支付宝聊天页面
     UMSocialPlatformType_YixinSession       = 8,//易信聊天页面
     UMSocialPlatformType_YixinTimeLine      = 9,//易信朋友圈
     UMSocialPlatformType_YixinFavorite      = 10,//易信收藏
     UMSocialPlatformType_LaiWangSession     = 11,//点点虫（原来往）聊天页面
     UMSocialPlatformType_LaiWangTimeLine    = 12,//点点虫动态
     UMSocialPlatformType_Sms                = 13,//短信

     NSArray *array = @[@"微信",@"朋友圈",@"QQ好友",@"新浪微博",@"取消"];

     */
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.05 animations:^{
        
        CATransition *animation = [CATransition animation];
        animation.duration = 0.2f;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.fillMode = kCAFillModeForwards;
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromBottom;
        [weakSelf.layer addAnimation:animation forKey:@"animation"];
        
    } completion:^(BOOL finished) {
        if (finished) {
            weakSelf.alpha = 0.0;
            weakSelf.overlayView.alpha = 0.0;
            [weakSelf.overlayView removeFromSuperview];
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (idx == 0) {
                [weakSelf shareWithWeChatScene:UMSocialPlatformType_WechatSession];
            }else if (idx == 1){
                [weakSelf shareWithWeChatScene:UMSocialPlatformType_WechatTimeLine];
                
            } else if (idx == 2){
                [weakSelf shareWithWeChatScene:UMSocialPlatformType_QQ];
            } else if (idx == 3) {
                [weakSelf shareWithWeChatScene:UMSocialPlatformType_Sina];
            }
        });
    }];
}


#pragma mark - share
- (void) shareWithWeChatScene:(int)scene
{
    if (_icon == nil)
    {
        __weak typeof(self) __weakSelf = self;
        if (_iconURL != nil) {
            // to do 下载图片
            
            //debug
            self.icon =imageNamed(@"icon_home_logo");
            [self shareWithScene:scene];

        }else
        {
            self.icon =imageNamed(@"icon_home_logo");
            [self shareWithScene:scene];
        }
    }else
    {
        [self shareWithScene:scene];
    }
}

- (void) shareWithScene: (int) scene
{
    [self WXShareWithTitle:self.title desc:self.desc icon:self.icon url:self.url WXScene: scene];
}

- (void) WXShareWithTitle: (NSString *) title desc: (NSString *) desc icon: (UIImage *) icon url:(NSString *) webpageUrl WXScene:(int)scene
{
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //设置文本
    messageObject.text = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
    
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = [UIImage imageNamed:@"icon"];
    [shareObject setShareImage:@"https://www.umeng.com/img/index/demo/1104.4b2f7dfe614bea70eea4c6071c72d7f5.jpg"];
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:scene messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];

}

- (void) onCancel
{
    [self dismiss];
}

+ (AJBShareSheetView *)shareArticleTitle: (NSString *) title desc:(NSString *) desc icon: (NSString *) icon url: (NSString *) url
{
    AJBShareSheetView *sheet = [[AJBShareSheetView alloc] init];
    sheet.title = title;
    sheet.desc = desc;
    sheet.iconURL = icon;
    sheet.url = url;
    return sheet;
    
}


@end
