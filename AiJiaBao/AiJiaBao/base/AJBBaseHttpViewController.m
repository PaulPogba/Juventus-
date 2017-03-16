//
//  AJBBaseHttpViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/15.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBBaseHttpViewController.h"
#import <WebKit/WebKit.h>

@interface AJBBaseHttpViewController ()<UIScrollViewDelegate,WKUIDelegate>

//@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation AJBBaseHttpViewController

- (id) initWithTitle: (NSString *) pageTitle url: (NSString *) pageURL
{
    if (self = [super init])
    {
        self.pageTitle = pageTitle;
        self.pageURL = pageURL;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationView.titleLabel.text = _pageTitle;
    [self createWebView];
}

- (void)onLeftItemAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) createWebView
{
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0,NAVITETION_HEIGHT,SCREEN_WIDTH,SCREEN_HEIGHT - NAVITETION_HEIGHT)];
    [self.view addSubview:_webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_pageURL]];
    [_webView loadRequest:request];
}


@end


