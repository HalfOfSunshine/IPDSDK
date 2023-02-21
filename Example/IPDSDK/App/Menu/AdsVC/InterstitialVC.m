//
//  InterstitialVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "InterstitialVC.h"

@interface InterstitialVC ()<IPDInterstitialAdDelegate>
@property(nonatomic,strong) IPDInterstitialAd *interstitialAd;
@end

@implementation InterstitialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isFirstLoad) {
        [self loadAd:AdId_Interstitial];
        self.isFirstLoad = NO;
    }
}

-(void) loadAd:(NSString*) adId{
    self.interstitialAd = [[IPDInterstitialAd alloc] initWithPlacementId:adId];
    self.interstitialAd.delegate = self;
    self.interstitialAd.mutedIfCan = YES;
    [self.interstitialAd loadAd];
}

#pragma mark =============== IPDInterstitialAdDelegate ===============
- (void)ipd_interstitialAdDidLoad:(IPDInterstitialAd*)ad{
    [self.interstitialAd presentAdFromRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (void)ipd_interstitialAdDidLoadFail:(IPDInterstitialAd*) ad error:(NSError * __nullable)error{
    NSLog(@"错误信息 %@",error);
}

- (void)ipd_interstitialAdDidPresentScreen:(IPDInterstitialAd*)ad{
    self.interstitialAd.mutedIfCan = NO;
}

- (void)ipd_interstitialAdDidClick:(IPDInterstitialAd*)ad{
    
}

- (void)ipd_interstitialAdDidClose:(IPDInterstitialAd*)ad{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)ipd_interstitialAdDetailDidClose:(IPDInterstitialAd*)ad{
    
}

- (void)ipd_interstitialAdDidFail:(IPDInterstitialAd*)ad error:(NSError * __nullable)error{
}


@end
