//
//  IPDNativeExpressFeedAd.h
//  IPDSDKCore
//
//  Created by IpdCoder on 2021/3/2.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <IPDSDKCore/IPDAdEventReport.h>
#import <IPDSDKCore/IPDStrategyManager.h>

NS_ASSUME_NONNULL_BEGIN
@class IPDNativeExpressFeedAd;
@protocol IPDNativeExpressFeedAdDelegate <NSObject>
@optional
/**
 * 广告渲染成功
 */
- (void)ipd_nativeExpressFeedAdRenderSuccess:(IPDNativeExpressFeedAd *)feedAd;
/**
 * 广告渲染失败
 */
- (void)ipd_nativeExpressFeedAdRenderFail:(IPDNativeExpressFeedAd *)feedAd;

/**
 *广告即将展示
 */
- (void)ipd_nativeExpressFeedAdViewWillShow:(IPDNativeExpressFeedAd *)feedAd;
/**
 *广告点击
 */
- (void)ipd_nativeExpressFeedAdDidClick:(IPDNativeExpressFeedAd *)feedAd;
/**
 *不喜欢该广告
 */
- (void)ipd_nativeExpressFeedAdDislike:(IPDNativeExpressFeedAd *)feedAd;
/**
 *展示落地页
 */
- (void)ipd_nativeExpressFeedAdDidShowOtherController:(IPDNativeExpressFeedAd *)nativeAd;
/**
 *关闭落地页
 */
- (void)ipd_nativeExpressFeedAdDidCloseOtherController:(IPDNativeExpressFeedAd *)nativeAd;

@end


@interface IPDNativeExpressFeedAd : NSObject

@property (nonatomic,strong,readonly) UIView *feedView;
@property (nonatomic)BOOL hasShown;

/**
 * Whether render is ready
 */
@property (nonatomic, assign,readonly) BOOL isReady;
@property (nonatomic, copy) NSString *adId;
@property (nonatomic, copy) NSString *ipd_adID;
@property (nonatomic, copy) NSString *platform;
@property (nonatomic, assign) IPDAdPlatformType platformType;


@property(nonatomic,weak) id<IPDNativeExpressFeedAdDelegate> delegate;

/*
 *required.[必选]
 * root view controller for handling ad actions.
 * 详解：开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *rootViewController;

/*
 *required [必选]
 *原生模板广告渲染
 */
- (void)render;


-(void)reportErrorEvent:(nonnull NSError *)supplementError;

#pragma mark - 事件上报
-(void)reportFeedAdWithEvent:(IPDEventString)event supplementMsg:(nullable NSString *)supplementMsg;
@end

NS_ASSUME_NONNULL_END
