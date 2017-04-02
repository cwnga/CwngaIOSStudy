//
//  CwngaWKWebViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 19/03/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "CwngaWKWebViewController.h"
#import <WebKit/WebKit.h>

@interface CwngaWKWebViewController () <WKNavigationDelegate, WKScriptMessageHandler>

@property (strong, nonatomic) WKWebView *wkWekView;

@end

@implementation CwngaWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    //Part2 - User Script
    NSString *myScriptSource = @"document.body.style.background = \"#777\";";

    WKUserScript *myUserScript = [[WKUserScript alloc] initWithSource:myScriptSource
                                                        injectionTime:WKUserScriptInjectionTimeAtDocumentEnd
                                                     forMainFrameOnly:NO];

    WKUserContentController *userContentController = [[WKUserContentController alloc] init];

    [userContentController addUserScript:myUserScript];

    config.userContentController = userContentController;

    NSString *myScriptSource1 = @"\
    function postMyMessage()  {\
    var message = { 'message' : 'Hello, World!', 'numbers' : [ 1, 2, 3 ] };\
    window.webkit.messageHandlers.myName.postMessage(message);  \
    }\
    postMyMessage();\
    ";

    WKUserScript *myUserScript1 = [[WKUserScript alloc] initWithSource:myScriptSource1
                                                         injectionTime:WKUserScriptInjectionTimeAtDocumentEnd
                                                      forMainFrameOnly:YES];
    [userContentController addUserScript:myUserScript1];
    [userContentController addScriptMessageHandler:self name:@"myName"];

    self.wkWekView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    self.wkWekView.navigationDelegate = self;
    self.wkWekView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.wkWekView.allowsBackForwardNavigationGestures = YES;

    [self.view addSubview:self.wkWekView];
    [self.wkWekView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://tw.yahoo.com"]]];



}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{

}
//Part1 - WKNavigationDelegate
#pragma mark - <WKNavigationDelegate>
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);

}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
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
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
}

- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler
{
    completionHandler(NSURLSessionAuthChallengeRejectProtectionSpace, nil);
}
@end
