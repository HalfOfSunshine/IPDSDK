//
//  IPDNativeAdAdapter.h
//  IPDSDKCore
//
//  Created by IpdCoder on 2021/3/29.
//

#import "IPDCoreAdAdapter.h"
#import "IPDNativeAdObject.h"
NS_ASSUME_NONNULL_BEGIN

@class IPDNativeAdAdapter;
@protocol IPDNativeAdAdapterDelegate <NSObject>
/**
 广告数据回调

 @param nativeAdObjects 广告数据数组
 @param error 错误信息
 */
- (void)ipdAdapter_nativeAd:(IPDNativeAdAdapter *)adAdapter didLoaded:(NSArray<IPDNativeAdObject *> * _Nullable)nativeAdObjects error:(NSError * _Nullable)error;


@end



@interface IPDNativeAdAdapter : IPDCoreAdAdapter

@property (nonatomic,weak)id <IPDNativeAdAdapterDelegate> delegate;

@property (nonatomic,strong,readonly)NSArray *nativeAdObjects;

/**
 广告数据回调
 */
- (void)nativeAdLoaded:(NSArray<IPDNativeAdObject *> * _Nullable)nativeAdObjects error:(NSError * _Nullable)error;



-(void)loadAdWithCount:(NSInteger)adCount;


@end

NS_ASSUME_NONNULL_END
