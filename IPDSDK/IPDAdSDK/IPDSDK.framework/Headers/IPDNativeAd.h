//
//  IPDNativeAd.h
//  IPDSDK
//
//  Created by IpdCoder on 2022/6/29.
//  Copyright © 2021 ipd. All rights reserved.
//

#import "IPDAd.h"
#import <IPDSDKCore/IPDNativeAdObject.h>
#import <IPDSDKCore/IPDNativeAdView.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IPDNativeAdDelegate <NSObject>
@optional
/**自渲染广告加载回调*/
- (void)ipd_nativeAdLoaded:(NSArray<IPDNativeAdObject *> * _Nullable)nativeAdObjects error:(NSError * _Nullable)error;

@end

@interface IPDNativeAd : IPDAd

@property (nonatomic, weak) id <IPDNativeAdDelegate> delegate;

- (void)loadAdWithCount:(NSInteger)adCount;

@end

NS_ASSUME_NONNULL_END
