//
//  IPDNativeExpressFeedAdManager.h
//  IPDSDK
//
//  Created by IpdCoder on 2022/6/8.
//  Copyright © 2021 ipd. All rights reserved.
//

#import "IPDAd.h"
#import <IPDSDKCore/IPDNativeExpressFeedAd.h>

NS_ASSUME_NONNULL_BEGIN
@class IPDNativeExpressFeedAdManager ,IPDNativeExpressFeedAd;
@protocol IPDNativeExpressFeedAdManagerDelegate <NSObject>
@optional
///load success
- (void)ipd_nativeExpressFeedAdManagerSuccessToLoad:(IPDNativeExpressFeedAdManager *)adsManager nativeAds:(NSArray<IPDNativeExpressFeedAd *> *_Nullable)feedAdDataArray;

///load faile
- (void)ipd_nativeExpressFeedAdManager:(IPDNativeExpressFeedAdManager *)adsManager didFailWithError:(NSError *_Nullable)error;

@end


@interface IPDNativeExpressFeedAdManager : IPDAd

@property (nonatomic, weak) id <IPDNativeExpressFeedAdManagerDelegate> delegate;

@property (nonatomic) CGSize adSize;

///video muted， default is NO
@property (nonatomic) BOOL mutedIfCan;

/*
 *required.
 * root view controller for handling ad actions.
 * 详解：开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *rootViewController;


@property (nonatomic, strong ,readonly) NSArray <IPDNativeExpressFeedAd *> *data;


- (instancetype)initWithPlacementId:(NSString *)placementId size:(CGSize)size;

/**
 * 加载广告，建议最大个数不超过5个
 */
- (void)loadAdDataWithCount:(NSInteger)count;

@end




NS_ASSUME_NONNULL_END
