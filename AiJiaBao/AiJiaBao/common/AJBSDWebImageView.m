//
//  AJBSDWebImageView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/24.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBSDWebImageView.h"
#import "UIImageView+WebCache.h"

@implementation AJBSDWebImageView
- (id) init
{
    if (self = [super init])
    {
        [self setContentMode:UIViewContentModeScaleAspectFill store:YES];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setBackgroundColor:[UIColor colorFromHexString:@"d5d5d5"] store:NO];
        
        [self setContentMode:UIViewContentModeScaleAspectFill store:YES];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame placeHolder: (UIImage *) image
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorFromHexString:@"d5d5d5"];
        self.image = image;
        self.placeHolder = image;
        [self setContentMode:UIViewContentModeScaleAspectFill store:YES];
    }
    
    return self;
}

- (void) setImageURL: (NSString *) url
{
    self.imgURL = url;
    [self setImageURL:url onComplete:nil];
}

- (void) setImageURL: (NSString *) url onComplete:(void (^)(UIImage *img))onComplete
{
//    if (_placeHolder == nil)
//    {
//        // user
//        if (url != nil && ([url rangeOfString:@"/head/"].location != NSNotFound ||[url rangeOfString:@"wx.qlogo.cn"].location != NSNotFound ||[url rangeOfString:@"/head_"].location != NSNotFound))
//        {
//            self.placeHolder = nil; //imageNamed(@"touxiang");
//        }else if (url != nil && ([url rangeOfString:@"/mask/"].location != NSNotFound ||[url rangeOfString:@"gift"].location != NSNotFound))
//        {
//            _placeHolder = nil;
//        } else {
//            self.placeHolder = nil;//imageNamed(@"char_action_photo");
//        }
//    }
//    
    /////调整展位图片缩放方式
    if (self.placeHolder.size.width>self.frame.size.width || self.placeHolder.size.height > self.frame.size.height)
    {//填充图片较大时，缩放后内接显示
        [self setContentMode:UIViewContentModeScaleAspectFit store:NO];
    }else
    {//填充图片较小， 直接居中显示
        [self setContentMode:UIViewContentModeCenter store:NO];
    }
    
    if (url == nil || url.length == 0)
    {
        self.image = _placeHolder;
    }else if ([url hasPrefix:@"http://"] || [url hasPrefix:@"https://"])
    {
        self.clipsToBounds = YES;
        __weak AJBSDWebImageView *__self = self;
        
        [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:_placeHolder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            [__self setImage:image onComplete:onComplete];
            
        }];
    }else
    {
        UIImage *img = imageNamed(url);
        if (img != nil && img.size.width>0)
        {
            self.image = img;
            [self setImage:img onComplete:onComplete];
        }else
        {
            self.image = _placeHolder;
        }
    }
}

- (void) setImage: (UIImage *) image onComplete:(void (^)(UIImage *img))onComplete
{
    if (image)
    {//内容为填充显示, 还原本来背景颜色
        [self setContentMode:self.defaultViewContentMode store:NO];
        [self setBackgroundColor:self.defaultBackgroundColor store:NO];
    }
    
    if (onComplete) {
        onComplete(image);
    }
}

- (void) setBackgroundColor:(UIColor *)backgroundColor
{
    [self setBackgroundColor:backgroundColor store:YES];
}

- (void) setBackgroundColor:(UIColor *)backgroundColor store: (BOOL) store
{
    [super setBackgroundColor:backgroundColor];
    if (store)
    {
        self.defaultBackgroundColor = backgroundColor;
    }
}

- (void) setContentMode:(UIViewContentMode)contentMode
{
    [self setContentMode:contentMode store:YES];
}

- (void) setContentMode:(UIViewContentMode)contentMode store: (BOOL) store
{
    [super setContentMode:contentMode];
    
    if (store) {
        self.defaultViewContentMode = contentMode;
    }
}


@end
