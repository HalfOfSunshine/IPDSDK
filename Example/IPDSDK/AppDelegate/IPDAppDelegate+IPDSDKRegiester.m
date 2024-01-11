//
//  IPDAppDelegate+IPDSDKRegiester.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/12.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDAppDelegate+IPDSDKRegiester.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import "View+MASAdditions.h"
@implementation IPDAppDelegate (IPDSDKRegiester)
//ipd_20201014iOSDEMO

- (void)setupIPDSDK{
    [IPDAdSDK setAppID:Appid];
    [IPDAdSDK setLogLevel:IPDAdSDKLogLevelDebug];
    NSString *version = [IPDAdSDK SDKVersion];
    NSLog(@"IPDSDK version：%@",version);

}

-(void)showSplashAdIfCan{
    self.splashAd = [[IPDSplashAd alloc]initWithPlacementId:AdId_Splash];
    self.splashAd.fetchDelay = 5;
    self.splashAd.delegate = self;
    self.splashAd.customBottomView = self.bottomView;
    self.splashAd.rootViewController = self.showWindow.rootViewController;
    [self.splashAd loadAd];
}

-(void)showSplashAd{
    self.showWindow.hidden = NO;
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            // 获取到权限后，获取idfa
            [self showSplashAdIfCan];
        }];
    } else {
        // Fallback on earlier versions
    }
}


/**
 *  开屏广告素材加载成功
 */
-(void)ipd_splashAdDidLoad:(IPDSplashAd *)splashAd{
    NSLog(@"kpgg-----加载成功");
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.splashAd showAdInWindow:self.showWindow];
    });
}

/**
 *  开屏广告成功展示
 */
-(void)ipd_splashAdSuccessPresentScreen:(IPDSplashAd *)splashAd{
    NSLog(@"kpgg-----展示成功");
}

/**
 *  开屏广告点击回调
 */
- (void)ipd_splashAdClicked:(IPDSplashAd *)splashAd{
    NSLog(@"kpgg-----点击广告");
}

/**
 *  开屏广告关闭回调
 */
- (void)ipd_splashAdClosed:(IPDSplashAd *)splashAd{
    NSLog(@"kpgg-----开屏关闭");
    dispatch_async(dispatch_get_main_queue(), ^{
        self.showWindow.hidden = YES;
    });
}

/**
 *  应用进入后台时回调
 *  详解: 当点击下载应用时会调用系统程序打开，应用切换到后台
 */
- (void)ipd_splashAdApplicationWillEnterBackground:(IPDSplashAd *)splashAd{
    NSLog(@"kpgg-----切换到后台");
}

/**
 * 开屏广告倒记时结束
 */
- (void)ipd_splashAdCountdownEnd:(IPDSplashAd*)splashAd{
    NSLog(@"kpgg-----倒计时结束");
}

/**
 *  开屏广告错误
 */
- (void)ipd_splashAdError:(IPDSplashAd *)splashAd withError:(NSError *)error{
    NSArray *errors =  [self.splashAd getFillFailureMessages];
    NSLog(@"开屏广告所有错误信息 %@",errors);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.showWindow.hidden = YES;
    });
}


#pragma mark =============== getter&setter ===============
- (IPDSplashAd*)splashAd{
    return objc_getAssociatedObject(self, @selector(splashAd));
}

- (void)setSplashAd:(IPDSplashAd *)splashAd{
    objc_setAssociatedObject(self, @selector(splashAd), splashAd,OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (UIView *)bottomView{
    UIView *_bottomView = objc_getAssociatedObject(self, @selector(bottomView));
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 100)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = [UIColor redColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:24];
        titleLabel.text = @"LOGO";
        [_bottomView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
        }];
    }
    return _bottomView;
}
- (void)setBottomView:(UIView *)bottomView{
    objc_setAssociatedObject(self, @selector(bottomView), bottomView,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
