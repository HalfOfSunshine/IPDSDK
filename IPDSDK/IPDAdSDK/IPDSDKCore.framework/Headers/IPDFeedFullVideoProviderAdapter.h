//
//  IPDFeedFullVideoProviderAdapter.h
//  IPDSDKCore
//
//  Created by Robin on 2021/1/14.
//

#import "IPDCoreAdAdapter.h"
#import "IPDFeedFullVideoProviderProtocol.h"
#import "IPDFeedFullVideoProviderAdapterDelegate.h"
#import "IPDFeedFullVideoAdAdapterView.h"
NS_ASSUME_NONNULL_BEGIN

@interface IPDFeedFullVideoProviderAdapter : IPDCoreAdAdapter<IPDFeedFullVideoProviderProtocol>
@property (nonatomic, strong, readonly) NSArray <IPDFeedFullVideoView *>*data;

@property(nonatomic,weak) id<IPDFeedFullVideoProviderAdapterDelegate> delegate;

- (void)ipd_feedFullVideoProviderAdapterLoadSuccess:(NSArray<__kindof IPDFeedFullVideoAdAdapterView *> *)views;

- (void)ipd_feedFullVideoProviderAdapterLoadFail:(NSError *_Nullable)error;

// 广告渲染成功, IPDFeedFullVideoView.size.height has been updated
- (void)ipd_feedFullVideoAdViewRenderSuccess:(IPDFeedFullVideoAdAdapterView*) adView;

// 广告渲染失败
- (void)ipd_feedFullVideoAdViewRenderFail:(IPDFeedFullVideoAdAdapterView*) adView error:(NSError *_Nullable)error;

// 广告曝光回调
- (void)ipd_feedFullVideoAdViewWillShow:(IPDFeedFullVideoAdAdapterView*) adView;

// 视频广告播放状态更改回调  ????
- (void)ipd_feedFullVideoAdViewStateDidChanged:(IPDFeedFullVideoAdAdapterView*) adView state:(IPDMediaPlayerStatus)playerState;

// 视频广告播放完成
- (void)ipd_feedFullVideoAdViewPlayerDidPlayFinish:(IPDFeedFullVideoAdAdapterView*) adView;

// 广告点击回调
- (void)ipd_feedFullVideoAdViewDidClick:(IPDFeedFullVideoAdAdapterView*) adView;

//  广告详情页面即将展示回调
- (void)ipd_feedFullVideoAdViewDetailViewWillPresentScreen:(IPDFeedFullVideoAdAdapterView*) adView;

// 广告详情页关闭回调
- (void)ipd_feedFullVideoAdViewDetailViewClosed:(IPDFeedFullVideoAdAdapterView*) adView;
@end

NS_ASSUME_NONNULL_END
