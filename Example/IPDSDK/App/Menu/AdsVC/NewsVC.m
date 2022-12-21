//
//  NewsVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/12/21.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "NewsVC.h"

#import "BaiduMobAdSDK/BaiduMobCpuInfoManager.h"
#import "BaiduMobAdSDK/BaiduMobAdCommonConfig.h"
#import <WebKit/WebKit.h>
#import <IPDSDK/IPDNewsAdView.h>
@interface NewsVC () <IPDNewsAdViewDelegate>
@property(nonatomic,strong) IPDNewsAdView *newsAdView;

@end

@implementation NewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackBarButton];
}
-(void)setBackBarButton{
    //返回按钮
    UIButton *backButton  =  [[UIButton alloc] init];
    backButton.titleLabel.font = [UIFont systemFontOfSize:16];
    backButton.userInteractionEnabled = YES;
    
    //    backButton.frame  =  CGRectMake(12.5, 0, 25, 25);
    // iOS 11 适配
    if (@available(iOS 11, *)) {
        backButton.frame  =  CGRectMake(2.5, 0, 22, 22);
    } else {
        backButton.frame  =  CGRectMake(12.5, 0, 22, 22);
    }
    if (@available(iOS 13.0, *)) {
        [backButton setImage:[UIImage systemImageNamed:@"chevron.backward"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage systemImageNamed:@"chevron.backward"] forState:UIControlStateHighlighted];
    } else {
        [backButton setTitle:@"Back" forState:UIControlStateNormal];
        [backButton setTitle:@"Back" forState:UIControlStateHighlighted];
    }
    backButton.imageEdgeInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    [backButton addTarget: self action:@selector(closeView) forControlEvents: UIControlEventTouchUpInside];
    UIView *leftview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 22)];
    [leftview addSubview:backButton];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftview];
}
//返回按钮
-(void)closeView
{
    if ([self.newsAdView canGoBack]) {
        [self.newsAdView goBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isFirstLoad) {
        [self loadAd:@"请联系运营索取"];
        self.isFirstLoad = NO;
    }
}


#pragma mark =============== IPDNewsAdViewDelegate ===============
/**
 news广告加载成功
 */
- (void)ipd_newsAdViewDidLoad:(IPDNewsAdView *)newsAdView{
    NSLog(@"====：%@",NSStringFromSelector(_cmd));
}

/**
 news广告加载失败
 */
- (void)ipd_newsAdView:(IPDNewsAdView *)newsAdView didLoadFailWithError:(NSError * _Nullable)error{
    NSLog(@"====：%@",NSStringFromSelector(_cmd));
    [self.newsAdView removeFromSuperview];
}

/**
 news广告奖励触发回调
 */
- (void)ipd_newsAdViewRewardEffective:(IPDNewsAdView *)newsAdView{
    NSLog(@"====：%@",NSStringFromSelector(_cmd));
}

/**
 点击news广告回调
 */
- (void)ipd_newsAdViewDidClick:(IPDNewsAdView *)newsAdView{
    NSLog(@"====：%@",NSStringFromSelector(_cmd));
}

-(void)loadAd:(NSString*) adId{
    if (_newsAdView) {
        [_newsAdView removeFromSuperview];
        _newsAdView = nil;
    }
    self.newsAdView = [[IPDNewsAdView alloc] initWithPlacementId:adId frame:self.view.bounds];
    self.newsAdView.delegate = self;
    [self.newsAdView loadAdAndShow];
    [self.view addSubview:self.newsAdView];
}
@end
