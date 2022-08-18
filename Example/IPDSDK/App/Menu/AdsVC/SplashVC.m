//
//  SplashVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "SplashVC.h"

@interface SplashVC ()<IPDSplashAdDelegate>
@property(nonatomic,strong) IPDSplashAd *splashAd;
@property(nonatomic,strong) UIView *bottomView;
@end

@implementation SplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    @"zjad_G9040714184494018",@"J8648995207",@"J5621495755",@"zjad_T887381439",@"c887417368"
    if (self.isFirstLoad) {
        [self loadAd:@"J8648995207"];
        self.isFirstLoad = NO;
    }
}

-(void) loadAd:(NSString*) adId{
    self.splashAd = [[IPDSplashAd alloc] initWithPlacementId:adId];
    self.splashAd.delegate = self;
    self.splashAd.fetchDelay = 5.0;
    self.splashAd.rootViewController = self;
    self.splashAd.customBottomView = self.bottomView;
    [self.splashAd loadAd];
}

#pragma mark =============== IPDSplashAdDelegate ===============
/**
 *  开屏广告素材加载成功
 */
-(void)ipd_splashAdDidLoad:(IPDSplashAd *)splashAd{
    [self.splashAd showAdInWindow:[UIApplication sharedApplication].keyWindow];
}

/**
 *  开屏广告成功展示
 */
-(void)ipd_splashAdSuccessPresentScreen:(IPDSplashAd *)splashAd{

}

/**
 *  开屏广告点击回调
 */
- (void)ipd_splashAdClicked:(IPDSplashAd *)splashAd{
    
}

/**
 *  开屏广告关闭回调
 */
- (void)ipd_splashAdClosed:(IPDSplashAd *)splashAd{
    [self.navigationController popViewControllerAnimated:YES];
}


/**
 *  开屏广告即将关闭回调
 */
- (void)ipd_splashAdWillClose:(IPDSplashAd *)splashAd{
    
}


/**
 *  应用进入后台时回调
 *  详解: 当点击下载应用时会调用系统程序打开，应用切换到后台
 */
- (void)ipd_splashAdApplicationWillEnterBackground:(IPDSplashAd *)splashAd{
}

/**
 * 开屏广告倒记时结束
 */
- (void)ipd_splashAdCountdownEnd:(IPDSplashAd*)splashAd{
    
}

/**
 *  开屏广告错误
 */
- (void)ipd_splashAdError:(IPDSplashAd *)splashAd withError:(NSError *)error{
    NSLog(@"error:%@",error);
}

- (void)ipd_splashAdAdapterDidRewardEffective:(IPDSplashAd *)splashAd withInfo:(NSDictionary *)info{
    NSLog(@"奖励触发，回调信息:%@",info);
}

#pragma mark =============== lazyload ===============
-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_H-100, SCREEN_W, 100)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:_bottomView.bounds];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor redColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:24];
        titleLabel.text = @"LOGO";
        [_bottomView addSubview:titleLabel];
        
    }
    return _bottomView;
}



@end
