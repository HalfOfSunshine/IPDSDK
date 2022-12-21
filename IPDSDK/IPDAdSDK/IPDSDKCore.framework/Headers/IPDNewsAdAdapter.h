//
//  IPDNewsAdAdapter.h
//  IPDSDKCore
//
//  Created by 麻明康 on 2022/12/20.
//

#import <IPDSDKCore/IPDCoreAdAdapter.h>
#import <IPDSDKCore/IPDNewsAdProtocol.h>
NS_ASSUME_NONNULL_BEGIN
@class IPDNewsAdAdapter;
@protocol IPDNewsAdAdapterDelegate <NSObject>
/**
 news广告加载成功
 */
- (void)ipdad_newsAdViewDidLoad:(IPDNewsAdAdapter *)newsAd;

/**
 news广告加载失败
 */
- (void)ipdad_newsAdView:(IPDNewsAdAdapter *)newsAd didLoadFailWithError:(NSError *_Nullable)error;


/**
 newsAdView曝光回调
 */
- (void)ipdad_newsAdViewWillBecomVisible:(IPDNewsAdAdapter *)newsAd;

/**
 关闭news广告回调
 */
- (void)ipdad_newsAdViewRewardEffective:(IPDNewsAdAdapter *)newsAd;

/**
 点击news广告回调
 */
- (void)ipdad_newsAdViewDidClick:(IPDNewsAdAdapter *)newsAd;

@end

@interface IPDNewsAdAdapter : IPDCoreAdAdapter <IPDNewsAdProtocol>
@property(nonatomic,weak) id<IPDNewsAdAdapterDelegate> delegate;
@property (nonatomic,weak)UIView *adView;
@property (nonatomic, strong) UILabel *remindLab;
- (instancetype)initWithAdItemConfig:(IPDAdUnitModel *)adItemConfig frame:(CGRect)frame;
@property (nonatomic, readonly) BOOL canGoBack;
@property (nonatomic, readonly) BOOL canGoForward;
- (void)goBack;
- (void)goForward;
//- (void)reload;
//- (void)stopLoading;

/**
 news广告加载成功
 */
- (void)ipdad_newsAdViewDidLoad:(IPDNewsAdAdapter *)newsAd;

/**
 news广告加载失败
 */
- (void)ipdad_newsAdView:(IPDNewsAdAdapter *)newsAd didLoadFailWithError:(NSError *_Nullable)error;


/**
 newsAdView曝光回调
 */
- (void)ipdad_newsAdViewWillBecomVisible:(IPDNewsAdAdapter *)newsAd;

/**
 news广告发奖回调
 */
- (void)ipdad_newsAdViewRewardEffective:(IPDNewsAdAdapter *)newsAd;

/**
 点击news广告回调
 */
- (void)ipdad_newsAdViewDidClick:(IPDNewsAdAdapter *)newsAd;


@end

NS_ASSUME_NONNULL_END
