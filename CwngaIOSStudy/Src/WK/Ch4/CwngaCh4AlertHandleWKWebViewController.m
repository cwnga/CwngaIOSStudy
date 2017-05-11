//
//  CwngaCh4AlertHandleWKWebViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 19/03/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//
#import <WebKit/WebKit.h>
#import <AppDevKit/AppDevKit.h>
#import "CwngaCh4AlertHandleWKWebViewController.h"

@interface CwngaCh4AlertHandleWKWebViewController () <WKNavigationDelegate, WKScriptMessageHandler, WKUIDelegate>

@property (strong, nonatomic) WKWebView *wkWekView;

@end

@implementation CwngaCh4AlertHandleWKWebViewController

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
    self.wkWekView.UIDelegate = self;

    self.wkWekView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.wkWekView.allowsBackForwardNavigationGestures = YES;

    [self.view addSubview:self.wkWekView];
//NSString prompt =  @"function myFunction() { var person = prompt(\"Please enter your name\", \"Harry Potter\"); if (person != null) { document.getElementById(\"demo\").innerHTML = \"Hello \" + person + \"! How are you today?\";} }";

    NSString *html = @"<html><script>alert(\"請確定你的付款資料 : \\n\
    -----------------------------------------------\\n\
    \\n\
    商戶 : Yahoo Brand Store (testing)\\n\
    金額 : HKD 1,200.00\\n\
    付款方法 : VISA\\n\
    信用卡號碼 : 4918-9141-0719-5005\\n\
    信用卡有效日期 : 7/2020\\n\
    持卡人姓名 : Test test\\n\
    信用卡檢查碼 : ***\\n\
    \\n\
    商戶參考編號 : sbs-97840-46965\\n\
    \");\
    \
    function testPrompt() { \
        var person = prompt(\"Please enter your name\", \"Harry Potter\"); \
        if (person != null) { \
            document.getElementById(\"demo\").innerHTML = \"Hello \" + person + \"! How are you today?\";\
        }\
        alert(person);\
    }\
    \
    function testConfirm() {\
        confirm(\"Press a button!\");\
    }\
    </script>\
    <body>\
    <button onclick=\"testPrompt()\">testPrompt</button></br>\
        <button onclick=\"testConfirm()\">testConfirm</button>\
    <p id=\"demo\"></p>\
    </body>\
    </html>";

    
    [self.wkWekView loadHTMLString:html baseURL:[NSURL URLWithString:@"https://tw.bid.yahoo.com"]];

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


#pragma mark - <WKUIDelegate>
- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    return webView;
}

- (void)webViewDidClose:(WKWebView *)webView
{
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"確認"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler();
                                                      }]];

    [alertController setValue:[self alertAttributeMessageWithString:message] forKey:@"attributedTitle"];

    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler(NO);
                                                      }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"確認"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler(YES);
                                                      }]];


    [alertController setValue:[self alertAttributeMessageWithString:message] forKey:@"attributedTitle"];

    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler(nil);
                                                      }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"確認"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          NSString *text = [alertController.textFields firstObject].text.length > 0 ? [alertController.textFields firstObject].text : defaultText;
                                                          completionHandler(text);
                                                      }]];



    [alertController setValue:[self alertAttributeMessageWithString:prompt] forKey:@"attributedTitle"];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {

    }];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (NSMutableAttributedString *)alertAttributeMessageWithString:(NSString *)string
{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentLeft;
    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:string
                                                                                        attributes:@{NSParagraphStyleAttributeName: style}
                                                  ];
    return attributedTitle;
}
@end
