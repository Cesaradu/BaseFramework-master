//
//  WebViewController.m
//  BaseFramework
//
//  Created by hztuen on 17/3/20.
//  Copyright © 2017年 Cesar. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate,UIScrollViewDelegate>
{
    UIWebView                    *_webView;
    NSURL                        *_url;
    NSMutableURLRequest          *_request;
}


@end

@implementation WebViewController

- (BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (id)initWithUrl:(NSString *)url title:(NSString *)title
{
    self = [super init];
    if (self)
    {
        self.title = title;
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        _url = [NSURL URLWithString:url];
        _webView = [[UIWebView alloc] initWithFrame:CGRectZero];
        [_webView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        _webView.backgroundColor = [UIColor colorWithHexString:@"eeeeee" alpha:1.0];
        _webView.delegate = self;
        [_webView setScalesPageToFit:YES];
        _webView.scrollView.delegate = self;
        _webView.scrollView.canCancelContentTouches = YES;
        _webView.scrollView.delaysContentTouches = NO;
        _request = [NSMutableURLRequest requestWithURL:_url];
        [_webView loadRequest:_request];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self buildNaviBarLelfBtn];
    [self createUI];
}

- (void)createUI
{
    _webView.frame = CGRectMake(0, 64, Width, Height-64);
    [self.view addSubview:_webView];
}

#pragma mark - buttonEvent

- (void)gotoNaviBarLelfBtn
{
    [super gotoNaviBarLelfBtn];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
