//
//  JSBridgeVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "JSBridgeVC.h"

@interface JSBridgeVC ()<WKNavigationDelegate,WKUIDelegate,IPDH5PageDelegate>
@property(nonatomic,strong) WKWebView *webView;
@property (nonatomic, strong) IPDWKWebViewBridge *ipdWKWebViewBridge;
@end

@implementation JSBridgeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.webView];
    [self loadAd];

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void) loadAd{
    [self.view addSubview:self.webView];
    self.ipdWKWebViewBridge = [IPDWKWebViewBridge new];
    IPDUser *user = [[IPDUser alloc]init];
    user.userID = @"123456";
    user.userName = @"xxxzz";
    [self.ipdWKWebViewBridge initWithRootViewController:self delegate:self];
    self.ipdWKWebViewBridge.user = user;
    [self.ipdWKWebViewBridge buildWKWebView:self.webView];
    NSURL *url = [NSURL URLWithString:@"http://static.jrongjie.com/zjsdk_project/pointsmall/template_b/index.html#/points_center?sdk_appid=Z7186381378"];
    NSURLRequest *req = [[NSURLRequest alloc]initWithURL:url];
    [self.webView loadRequest:req];
}

#pragma mark - WKUIDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSURL *url = navigationAction.request.URL;
    NSString *urlStr = (url) ?url.absoluteString:@"";
    if([urlStr containsString:@"//itunes.apple.com/"]||[urlStr containsString:@"//apps.apple.com/"]){
        [[UIApplication sharedApplication] openURL:url];
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }else if (url.scheme&&([url.scheme hasPrefix:@"alipays"]||[url.scheme hasPrefix:@"alipay"])){
        // NOTE: 跳转支付宝App
        [[UIApplication sharedApplication]openURL:url];

        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }else if (url.scheme&&([url.scheme hasPrefix:@"tbopen"]||[url.scheme hasPrefix:@"tbopens"])){
        // NOTE: 跳转支付宝App
        [[UIApplication sharedApplication]openURL:url];

        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }else if(url.scheme&&![url.scheme hasPrefix:@"http"]){
        [[UIApplication sharedApplication]openURL:url];
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }
    

    if (navigationAction.navigationType==WKNavigationTypeLinkActivated) {//二级
        //self.closeButton.hidden = NO;
    }else if (navigationAction.navigationType==WKNavigationTypeBackForward) {//判断是返回类型
        
    }
    //这句是必须加上的，不然会异常
    decisionHandler(WKNavigationActionPolicyAllow);
}





// 输入框
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler{
    //必须调用
    if(![self.ipdWKWebViewBridge runJavaScriptTextInputPanelWithPrompt:prompt defaultText:defaultText initiatedByFrame:frame completionHandler:completionHandler]){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.text = defaultText;
        }];
        [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completionHandler(alertController.textFields[0].text?:@"");
        }])];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

#pragma mark =============== WKNavigationDelegate ===============
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{

}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.title = webView.title;
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{

}
//这个代理是服务器redirect时调用 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{

}



//根据webView、navigationAction相关信息决定这次跳转是否可以继续进行,这些信息包含HTTP发送请求，如头部包含User-Agent,Accept,refer
// 在发送请求之前，决定是否跳转的代理
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
//
//    if (navigationAction.navigationType==WKNavigationTypeLinkActivated) {//二级
//        //self.closeButton.hidden = NO;
//    }else if (navigationAction.navigationType==WKNavigationTypeBackForward) {//判断是返回类型
//
//    }
//    decisionHandler(WKNavigationActionPolicyAllow);
//}

//这个代理方法表示当客户端收到服务器的响应头，根据response相关信息，可以决定这次跳转是否可以继续进行。
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{

    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}

/**
 *  准备加载页面。等同于UIWebViewDelegate: - webView:shouldStartLoadWithRequest:navigationType
 *
 *  @param webView
 *  @param navigation
 */
//- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
//}


#pragma mark =============== lazyload ===============
-(WKWebView *)webView{
    if(!_webView){
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        //[wkUController addUserScript:wkUScript];
        WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
        wkWebConfig.preferences=[[WKPreferences alloc] init];
        wkWebConfig.preferences.minimumFontSize=10;
        wkWebConfig.preferences.javaScriptEnabled=YES;
        wkWebConfig.websiteDataStore = [WKWebsiteDataStore defaultDataStore];
        
        [wkWebConfig.preferences setValue:@YES forKey:@"allowFileAccessFromFileURLs"];
        if (@available(iOS 10.0, *)) {
             [wkWebConfig setValue:@YES forKey:@"allowUniversalAccessFromFileURLs"];
        }
        //wkWebConfig.preferences.javaScriptCanOpenWindowsAutomatically=NO;
        wkWebConfig.userContentController = wkUController;
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:wkWebConfig];;
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        
        [_webView sizeToFit];
        [_webView setAutoresizesSubviews:YES];
        [_webView setAllowsBackForwardNavigationGestures:true];
    }
    return _webView;
}

@end
