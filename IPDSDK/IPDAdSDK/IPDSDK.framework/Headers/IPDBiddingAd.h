//
//  IPDBiddingAd.h
//  IPDSDK
//
//  Created by 麻明康 on 2022/11/11.
//  Copyright © 2022 ipd. All rights reserved.
//

#import <IPDSDK/IPDAd.h>
#import <IPDSDKCore/IPDBiddingAdAdapter.h>
#import <IPDSDKCore/IPDAdCountdown.h>
#import <IPDSDKCore/IPDAdPreferenceManager.h>
#import <IPDSDKCore/IPDStrategyManager.h>

NS_ASSUME_NONNULL_BEGIN
@protocol IPDBiddingProtocol <NSObject>

@required
-(void)dealSuccessResult;
-(void)dealFailResultWithError:(NSError*)error;
-(IPDBiddingAdAdapter *)createAdapterForUnit:(IPDAdUnitModel *)unit;

@optional
-(void)dealDispalyFailWithError:(NSError *)error;
- (NSInteger)getCountDownInterval;
@end



@interface IPDBiddingAd : IPDAd<IPDBiddingProtocol>{
    BOOL _needDelayLoadAd;
    BOOL _takeFastReturnAd;
    NSInteger eCPM1;
    NSInteger eCPM2;
}

@property (nonatomic,strong)dispatch_semaphore_t semaphore;
@property (nonatomic, strong) dispatch_queue_t semaphoreQueue;

//倒计时器
@property (nonatomic,strong)IPDAdCountdown *countdown;
//数据管理
@property (nonatomic,strong)IPDAdPreferenceManager *adManager;
//pd广告请求对象数组
@property (nonatomic,strong)NSMutableArray <IPDBiddingAdAdapter *>*adapterArrayPD;
//bd广告请求对象数组
@property (nonatomic,strong)NSMutableArray <IPDBiddingAdAdapter *>*adapterArrayBD;

//pd广告请求成功数组
@property (nonatomic,strong)NSMutableArray <IPDBiddingAdAdapter *>*successAdaptersPD;

//bd广告请求成功数组
@property (nonatomic,strong)NSMutableArray <IPDBiddingAdAdapter *>*successAdaptersBD;


@property (nonatomic,strong)IPDBiddingAdAdapter *ecpm1Adapter;

@property (nonatomic,strong,nullable)IPDBiddingAdAdapter *currentAdapter;

//错误信息数组
@property (nonatomic,strong)NSMutableArray <NSError *>*adFailArray;

@property (nonatomic,strong)NSMutableString *logString;

-(void)loadAd;
-(void)unitAdapterDidLoad:(IPDBiddingAdAdapter *)adapter;
-(void)unitAdapterLoadFail:(IPDBiddingAdAdapter *)adapter error:(NSError *)error;
@end

NS_ASSUME_NONNULL_END
