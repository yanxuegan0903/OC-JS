//
//  WEBViewController.m
//  TestOC&JS
//
//  Created by vsKing on 2018/4/20.
//  Copyright © 2018年 vsKing. All rights reserved.
//

#import "WEBViewController.h"

@interface WEBViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *web;

@end

@implementation WEBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initWebView];
    [self initBackBtn];
    
    
}

- (void)initWebView{
    UIWebView * web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:web];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.jianshu.com/p/1bd426ad2f2b"]];
    [web loadRequest:request];
    web.delegate = self;
    self.web = web;
}

- (void)initBackBtn{
    UIButton * backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [backBtn setBackgroundColor:[UIColor purpleColor]];
    [backBtn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = back;
}


- (void)backBtnClicked{
    NSLog(@"back");
    if (self.web.canGoBack) {
        [self.web goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}



#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSURL * url = request.URL;
    NSString * query = url.query;
    
    NSLog(@"\nurl == %@\nquery = %@",url,query);
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString * title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"title = %@",title);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.navigationItem.title = title;
    });
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

@end
