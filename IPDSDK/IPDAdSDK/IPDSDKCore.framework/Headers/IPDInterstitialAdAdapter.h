//
//  IPDInterstitialAdAdapter.h
//  IPDSDKCore
//
//  Created by Robin on 2021/1/14.
//


#import "IPDCoreAdAdapter.h"
#import "IPDInterstitialAdProtocol.h"
#import "IPDInterstitialAdAdapterDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface IPDInterstitialAdAdapter : IPDCoreAdAdapter<IPDInterstitialAdProtocol>

@property(nonatomic,weak) id<IPDInterstitialAdAdapterDelegate> delegate;

- (void) ipd_interstitialAdDidLoad;

- (void) ipd_interstitialAdDidLoadFail:(NSError * __nullable)error;

- (void) ipd_interstitialAdDidPresentScreen;

- (void) ipd_interstitialAdDidClick;

- (void) ipd_interstitialAdDidClose;

- (void) ipd_interstitialAdDetailDidClose;

- (void) ipd_interstitialAdDidFail:(NSError * __nullable)error;

@end

NS_ASSUME_NONNULL_END
