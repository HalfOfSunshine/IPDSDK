//
//  BannerVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "BannerVC.h"

@interface BannerVC ()<IPDBannerAdViewDelegate>
@property(nonatomic,strong) IPDBannerAdView *bannerView;

@end

@implementation BannerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isFirstLoad) {
        [self loadAd:@"P334tw3t7qdm"];
        self.isFirstLoad = NO;
    }
}

-(void) loadAd:(NSString*) adId{
    self.bannerView = [[IPDBannerAdView alloc] initWithPlacementId:adId viewController:self adSize:CGSizeMake(SCREEN_W, 200)];
    self.bannerView.frame = CGRectMake(0, SCREEN_H-TopBar_H-SafeAreaBottomHeight, SCREEN_W, 200);
    self.bannerView.delegate = self;
    [self.bannerView loadAdAndShow];
    [self.view addSubview:self.bannerView];
}

#pragma mark IPDBannerAdViewDelegate
// banner广告加载成功
- (void)ipd_bannerAdViewDidLoad:(IPDBannerAdView *)bannerAdView{

}

// banner广告加载失败
- (void)ipd_bannerAdView:(IPDBannerAdView *)bannerAdView didLoadFailWithError:(NSError *_Nullable)error{
}


// bannerAdView曝光回调
- (void)ipd_bannerAdViewWillBecomVisible:(IPDBannerAdView *)bannerAdView{
}

// 关闭banner广告
- (void)ipd_bannerAdViewDislike:(IPDBannerAdView *)bannerAdView{
    [self.navigationController popViewControllerAnimated:YES];
}

// 点击banner广告回调
- (void)ipd_bannerAdViewDidClick:(IPDBannerAdView *)bannerAdView{
    
}

// 关闭banner广告详情页
- (void)ipd_bannerAdViewDidCloseOtherController:(IPDBannerAdView *)bannerAdView{
    
}


@end
