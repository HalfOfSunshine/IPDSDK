//
//  IPDNativeAdView.h
//  IPDSDKCore
//
//  Created by IpdCoder on 2021/3/29.
//

#import <UIKit/UIKit.h>
#import "IPDNativeAdObject.h"
NS_ASSUME_NONNULL_BEGIN

@class IPDNativeAdView;
@protocol IPDNativeAdViewDelegate <NSObject>
@optional
//广告曝光回调
-(void)ipd_nativeAdViewWillExpose:(IPDNativeAdView *)nativeAdView;
//广告点击回调
-(void)ipd_nativeAdViewDidClick:(IPDNativeAdView *)nativeAdView;
//广告详情页关闭回调
-(void)ipd_nativeAdDetailViewClosed:(IPDNativeAdView *)nativeAdView;
//广告详情页面即将展示回调
-(void)ipd_nativeAdDetailViewWillPresentScreen:(IPDNativeAdView *)nativeAdView;

@end


@interface IPDNativeAdView : UIView

/**
 广告 View 时间回调对象
 */
@property (nonatomic, weak) id <IPDNativeAdViewDelegate> delegate;

/*
 *  viewControllerForPresentingModalView
 *  详解：开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *viewController;

/**
  视频广告的媒体View，绑定数据对象后自动生成，可自定义布局
 */
@property (nonatomic, strong) UIView *videoAdView;

/**
  logoView，绑定数据对象后自动生成，可自定义布局
 */
@property (nonatomic, strong, readonly) UIView *logoView;


- (void)registerDataObject:(IPDNativeAdObject *)dataObject;

/**
 自渲染2.0视图注册方法
 @param dataObject 数据对象，必传字段
 */
- (void)registerDataObject:(IPDNativeAdObject *)dataObject clickableViews:(NSArray<UIView *> *)clickableViews;


/**
 注册可点击的callToAction视图的方法
 建议开发者使用IPDNativeAdObject中的callToAction字段来创建视图，并取代自定义的下载或打开等button,
 调用此方法之前必须先调用registerDataObject:clickableViews
 @param callToActionView CTA视图, 系统自动处理点击事件
 */
- (void)registerClickableCallToActionView:(UIView *)callToActionView;


/**
 注销数据对象，在 tableView、collectionView 等场景需要复用 GDTUnifiedNativeAdView 时，
 需要在合适的时机，例如 cell 的 prepareForReuse 方法内执行 unregisterDataObject 方法，
 将广告对象与 IPDNativeAdView 解绑
 */
- (void)unregisterDataObject;

@end

NS_ASSUME_NONNULL_END
