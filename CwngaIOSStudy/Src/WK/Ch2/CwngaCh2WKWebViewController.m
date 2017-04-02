//
//  CwngaCh2WKWebViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 19/03/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "CwngaCh2WKWebViewController.h"
#import <WebKit/WebKit.h>

@interface CwngaCh2WKWebViewController ()
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) WKWebView *wkWekView1;
@property (strong, nonatomic) WKWebView *wkWekView2;

@end

@implementation CwngaCh2WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //FOR different data store (cookies..., etc.)
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.processPool = [[WKProcessPool alloc] init];
    config.websiteDataStore = [WKWebsiteDataStore nonPersistentDataStore];
    self.wkWekView1 = [[WKWebView alloc] initWithFrame:self.view1.bounds configuration:config];
    self.wkWekView1.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.wkWekView1.frame = self.view1.bounds;
    [self.view1 addSubview:self.wkWekView1];

    [self.wkWekView1 loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://tw.yahoo.com"]]];

    WKWebViewConfiguration *config2 = [[WKWebViewConfiguration alloc] init];
    config2.processPool = [[WKProcessPool alloc] init];
    config2.websiteDataStore = [WKWebsiteDataStore nonPersistentDataStore]; //NOTE: different cookie store, if no set this, will use same store, for all wkwebview
    self.wkWekView2 = [[WKWebView alloc] initWithFrame:self.view2.bounds configuration:config2];
    self.wkWekView2.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.wkWekView2.frame = self.view2.bounds;
    [self.view2 addSubview:self.wkWekView2];
    [self.wkWekView2 loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://tw.yahoo.com"]]];

}


@end
