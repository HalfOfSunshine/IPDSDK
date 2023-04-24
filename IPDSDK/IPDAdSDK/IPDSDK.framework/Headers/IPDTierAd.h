//
//  IPDTierAd.h
//  IPDSDK
//
//  Created by 麻明康 on 2022/11/11.
//  Copyright © 2022 ipd. All rights reserved.
//

#import <IPDSDK/IPDAd.h>
#import <IPDSDKCore/IPDTierAdAdapter.h>
#import <IPDSDKCore/IPDAdCountdown.h>
#import <IPDSDKCore/IPDAdPreferenceManager.h>
#import <IPDSDKCore/IPDStrategyManager.h>
#import "IPDTierAdLoader.h"

NS_ASSUME_NONNULL_BEGIN
@protocol IPDBiddingProtocol <NSObject>
@required
-(void)dealSuccessResult;
-(void)dealFailResultWithError:(NSError*)error;
-(IPDTierAdLoader *)createTierLoader:(NSArray <IPDAdUnitModel *>*)tiers;

@optional
- (NSInteger)getCountDownInterval;
@end



@interface IPDTierAd : IPDAd<IPDBiddingProtocol>{
    BOOL _needDelayLoadAd;
    BOOL _takeFastReturnAd;
    NSInteger eCPM1;
    NSInteger eCPM2;
}

//倒计时器
//@property (nonatomic,strong)IPDAdCountdown *countdown;
//数据管理
@property (nonatomic,strong)IPDAdPreferenceManager *adManager;

//错误信息数组
@property (nonatomic,strong)NSMutableArray <NSError *>*adFailArray;

@property (nonatomic,strong)NSMutableString *logString;


//pd广告请求成功数组
@property (nonatomic,strong)NSMutableArray <IPDTierAdAdapter *>*successAdaptersPD;

//bd广告请求成功数组
@property (nonatomic,strong)NSMutableArray <IPDTierAdAdapter *>*successAdaptersBD;


@property (nonatomic,strong)IPDTierAdAdapter *ecpm1Adapter;

@property (nonatomic,strong,nullable)IPDTierAdAdapter *currentAdapter;

-(void)loadAd;
@end

NS_ASSUME_NONNULL_END
