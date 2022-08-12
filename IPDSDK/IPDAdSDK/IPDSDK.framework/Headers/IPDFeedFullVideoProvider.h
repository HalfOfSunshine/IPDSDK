//
//  IPDFeedFullVideoProvider.h
//  IPDSDK
//
//  Created by Robin on 2020/10/9.
//  Copyright © 2020 ipd. All rights reserved.
//

#import "IPDAd.h"
#import <IPDSDKCore/IPDFeedFullVideoProviderProtocol.h>
#import <IPDSDKCore/IPDFeedFullVideoView.h>
#import <IPDSDKCore/IPDSDKAdEnum.h>
NS_ASSUME_NONNULL_BEGIN

@class IPDFeedFullVideoProvider;
@protocol IPDFeedFullVideoProviderDelegate <NSObject>

/**
 * 广告加载成功
 */
- (void)ipd_feedFullVideoProviderLoadSuccess:(IPDFeedFullVideoProvider *)provider views:(NSArray<__kindof IPDFeedFullVideoView *> *)views;

/**
* 广告加载失败
*/
- (void)ipd_feedFullVideoProviderLoadFail:(IPDFeedFullVideoProvider *)provider error:(NSError *_Nullable)error;

/**
 * 广告渲染成功, IPDFeedFullVideoView.size.height has been updated
 */
- (void)ipd_feedFullVideoAdViewRenderSuccess:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView;

/**
 * 广告渲染失败
 */
- (void)ipd_feedFullVideoAdViewRenderFail:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView error:(NSError *_Nullable)error;

/**
 * 广告曝光回调
 */
- (void)ipd_feedFullVideoAdViewWillShow:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView;

/**
视频广告播放状态更改回调
*/
- (void)ipd_feedFullVideoAdViewStateDidChanged:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView state:(IPDMediaPlayerStatus)playerState;
/**
视频广告播放完毕
*/
- (void)ipd_feedFullVideoAdViewPlayerDidPlayFinish:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView;

/**
 * 广告点击回调
 */
- (void)ipd_feedFullVideoAdViewDidClick:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView;

/**
* 广告详情页面即将展示回调
*/
- (void)ipd_feedFullVideoAdViewDetailViewWillPresentScreen:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView;

/**
 *广告详情页关闭回调
 */
- (void)ipd_feedFullVideoAdViewDetailViewClosed:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView;


@end

@interface IPDFeedFullVideoProvider : IPDAd<IPDFeedFullVideoProviderProtocol>

@property (nonatomic, weak) id <IPDFeedFullVideoProviderDelegate> delegate;


@end



NS_ASSUME_NONNULL_END
