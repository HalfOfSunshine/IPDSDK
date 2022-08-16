//
//  FullScreenVideoVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "FullScreenVideoVC.h"

@interface FullScreenVideoVC ()<IPDFullScreenVideoAdDelegate>
@property (nonatomic,strong)IPDFullScreenVideoAd *fullVideoAd;
@end

@implementation FullScreenVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    @"J2068944817",@"J9684504174"
    if (self.isFirstLoad) {
        [self loadAd:@"J2068944817"];
        self.isFirstLoad = NO;
    }
}

-(void) loadAd:(NSString*) adId{
    self.fullVideoAd = [[IPDFullScreenVideoAd alloc] initWithPlacementId:adId];
    self.fullVideoAd.delegate = self;
    [self.fullVideoAd loadAd];
}

//广告加载成功
- (void)ipd_fullScreenVideoAdDidLoad:(IPDFullScreenVideoAd*)ad{
    [self.fullVideoAd presentFullScreenVideoAdFromRootViewController:self];
}

//广告加载失败
- (void)ipd_fullScreenVideoAdDidLoadFail:(IPDFullScreenVideoAd*)ad error:(NSError * __nullable)error{
    NSLog(@"error:%@",error);
}

//广告展示
- (void)ipd_fullScreenVideoAdDidShow:(IPDFullScreenVideoAd *)ad{
    
}

//广告点击
- (void)ipd_fullScreenVideoAdDidClick:(IPDFullScreenVideoAd *)ad{
    
}

//广告关闭
- (void)ipd_fullScreenVideoAdDidClose:(IPDFullScreenVideoAd *)ad{

}

//广告详情页关闭
- (void)ipd_fullScreenVideoAdDetailDidClose:(IPDFullScreenVideoAd *)ad{
    
}

//错误
- (void)ipd_fullScreenVideoAdDidFail:(IPDFullScreenVideoAd*)ad error:(NSError * __nullable)error{
    NSLog(@"error:%@",error);
}

//播放状态
-(void)ipd_fullScreenVideoAd:(IPDFullScreenVideoAd *)ad playerStatusChanged:(IPDMediaPlayerStatus)playerStatus{
    
}

//详情页打开
- (void)ipd_fullScreenVideoAdDetailDidPresent:(IPDFullScreenVideoAd*)ad{
    
}
@end
