//
//  CwngaCh3WKWebViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 19/03/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "CwngaCh3WKWebViewController.h"
#import <WebKit/WebKit.h>

@interface CwngaCh3WKWebViewController () <WKNavigationDelegate, WKScriptMessageHandler>

@property (strong, nonatomic) WKWebView *wkWekView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@end

@implementation CwngaCh3WKWebViewController
- (IBAction)goUrl:(id)sender
{
    NSURL *url = [NSURL URLWithString:self.urlTextField.text];
    if (url) {
        [self.wkWekView loadRequest:[NSURLRequest requestWithURL:url]];
    }
}
- (IBAction)goback:(id)sender {
    [self.wkWekView goBack];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.processPool = [[WKProcessPool alloc] init];
    config.websiteDataStore = [WKWebsiteDataStore defaultDataStore];
    NSSet *test = [WKWebsiteDataStore allWebsiteDataTypes];
    [config.websiteDataStore fetchDataRecordsOfTypes:test completionHandler:^(NSArray<WKWebsiteDataRecord *> * wkWebsiteDataRecord) {
        NSLog(@"wkWebsiteDataRecord:%@", wkWebsiteDataRecord);
    }];
    self.wkWekView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    self.wkWekView.navigationDelegate = self;
    self.wkWekView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.wkWekView.allowsBackForwardNavigationGestures = YES;

    [self.view insertSubview:self.wkWekView atIndex:0];
    [self.wkWekView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://tw.yahoo.com"]]];
}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{

}
//Part1 - WKNavigationDelegate
#pragma mark - <WKNavigationDelegate>
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSLog(@"cwng ---------> request.allHTTPHeaderFields %@", navigationAction.request.allHTTPHeaderFields);
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
   NSHTTPURLResponse *response =  (NSHTTPURLResponse *)navigationResponse.response;
    NSLog(@"cwng ---------> response.allHeaderFields %@", response.allHeaderFields);


    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation
{
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    [self.wkWekView evaluateJavaScript:@"document.cookie" completionHandler:^(id result, NSError * _Nullable error) {
        NSLog(@"cwng -------> didFinishNavigation cookie:%@", result);
    }];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
}

- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler
{
    completionHandler(NSURLSessionAuthChallengeRejectProtectionSpace, nil);
}
@end
