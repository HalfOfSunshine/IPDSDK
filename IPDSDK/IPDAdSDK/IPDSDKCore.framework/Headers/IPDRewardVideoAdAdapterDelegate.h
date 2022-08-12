//
//  IPDRewardVideoAdAdapterDelegate.h
//  IPDSDKCore
//
//  Created by Robin on 2021/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class IPDRewardVideoAdAdapter;
@protocol IPDRewardVideoAdAdapterDelegate <NSObject>

- (void)ipd_rewardVideoAdAdapterDidLoad:(IPDRewardVideoAdAdapter *)adapter;

- (void)ipd_rewardVideoAdAdapterVideoDidLoad:(IPDRewardVideoAdAdapter *)adapter;

- (void)ipd_rewardVideoAdAdapterDidShow:(IPDRewardVideoAdAdapter *)adapter;

- (void)ipd_rewardVideoAdAdapterDidClose:(IPDRewardVideoAdAdapter *)adapter;

- (void)ipd_rewardVideoAdAdapterDidClicked:(IPDRewardVideoAdAdapter *)adapter;

- (void)ipd_rewardVideoAdAdapterDidRewardEffective:(IPDRewardVideoAdAdapter *)adapter;

- (void)ipd_rewardVideoAdAdapterDidPlayFinish:(IPDRewardVideoAdAdapter *)adapter;

- (void)ipd_rewardVideoAdAdapter:(IPDRewardVideoAdAdapter *)adapter didFailWithError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
