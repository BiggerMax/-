//
//  WebViewController.m
//  驾照助手
//
//  Created by 袁杰 on 16/10/24.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
{
    UIWebView *_webView;
}

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(instancetype)initWithUrl:(NSString *)url{
    self = [super init];
    if (self) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
        [_webView loadRequest:request];
        [self.view addSubview:_webView];
    }
    return self;
}

@end
