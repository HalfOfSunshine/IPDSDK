//
//  RewardVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "RewardVC.h"

@interface RewardVC ()<IPDRewardVideoAdDelegate>
@property(nonatomic,strong) IPDRewardVideoAd *rewardVideoAd;

@end

@implementation RewardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    @"c945709452",@"ipdad_iOS_ZR0001",@"ipdad_T945484376"
    if (self.isFirstLoad) {
        [self loadAd:@"c945709452"];
        self.isFirstLoad = NO;
    }
}

-(void) loadAd:(NSString*) adId{
//    uid尽量传真实的UID
    self.rewardVideoAd = [[IPDRewardVideoAd alloc] initWithPlacementId:adId userId:@"uid"];
    self.rewardVideoAd.reward_name = @"奖励名称字段";
    self.rewardVideoAd.reward_amount = 10;
    self.rewardVideoAd.extra = @"123";
    self.rewardVideoAd.delegate = self;
    [self.rewardVideoAd loadAd];
}

#pragma mark - IPDRewardVideoAdDelegate
///广告加载成功
- (void)ipd_rewardVideoAdDidLoad:(IPDRewardVideoAd *)rewardedVideoAd{
}

/// 视频下载成功，视频下载成功后再去展示
- (void)ipd_rewardVideoAdVideoDidLoad:(IPDRewardVideoAd *)rewardedVideoAd{
    [self.rewardVideoAd showAdInViewController:self];
}


- (void)ipd_rewardVideoAdDidShow:(IPDRewardVideoAd *)rewardedVideoAd{
    NSLog(@"%s",__FUNCTION__);

}

- (void)ipd_rewardVideoAdDidRewardEffective:(IPDRewardVideoAd *)rewardedVideoAd{
    NSLog(@"===== %@",rewardedVideoAd.trade_id);
}


- (void)ipd_rewardVideoAdDidClose:(IPDRewardVideoAd *)rewardedVideoAd{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)ipd_rewardVideoAdDidClicked:(IPDRewardVideoAd *)rewardedVideoAd{
    
}

- (void)ipd_rewardVideoAdDidPlayFinish:(IPDRewardVideoAd *)rewardedVideoAd{
    
}

- (void)ipd_rewardVideoAd:(IPDRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error{
    NSLog(@"error:%@",error);
}


@end
