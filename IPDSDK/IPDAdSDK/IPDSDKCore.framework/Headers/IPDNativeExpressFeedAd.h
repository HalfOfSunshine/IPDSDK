//
//  IPDNativeExpressFeedAd.h
//  IPDSDKCore
//
//  Created by Rare on 2021/3/2.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <IPDSDKCore/IPDAdEventReport.h>
#import <IPDSDKCore/IPDStrategyManager.h>
#import <IPDSDKCore/IPDSDKManager.h>

NS_ASSUME_NONNULL_BEGIN
@class IPDNativeExpressFeedAd;
@protocol IPDNativeExpressFeedAdDelegate <NSObject>
@optional
/**
 * 广告渲染成功
 */
- (void)IPD_nativeExpressFeedAdRenderSuccess:(IPDNativeExpressFeedAd *)feedAd;
/**
 * 广告渲染失败
 */
- (void)IPD_nativeExpressFeedAdRenderFail:(IPDNativeExpressFeedAd *)feedAd;

/**
 *广告即将展示
 */
- (void)IPD_nativeExpressFeedAdViewWillShow:(IPDNativeExpressFeedAd *)feedAd;
/**
 *广告点击
 */
- (void)IPD_nativeExpressFeedAdDidClick:(IPDNativeExpressFeedAd *)feedAd;
/**
 *不喜欢该广告
 */
- (void)IPD_nativeExpressFeedAdDislike:(IPDNativeExpressFeedAd *)feedAd;
/**
 *展示落地页
 */
- (void)IPD_nativeExpressFeedAdDidShowOtherController:(IPDNativeExpressFeedAd *)nativeAd;
/**
 *关闭落地页
 */
- (void)IPD_nativeExpressFeedAdDidCloseOtherController:(IPDNativeExpressFeedAd *)nativeAd;

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
-(void)reportWithEvent:(IPDEventString)event supplementMsg:(nullable NSString *)supplementMsg;

/**
 * 返回广告的eCPM，广告加载成功后调用有效，单位：分
 
 * @return 成功返回一个大于等于0的值，
 *
 * @Discussion 返回信息说明：
 *
 * -1表示无权限或后台出现异常，
 *
 * -2表示当前广告类型暂不支持实时竞价。
 *
 * -3表示实时竞价二价获取失败，请在收到广告加载成功之后的回调后获取
 *
 * -4表示pd价格获取失败，请在收到广告加载成功之后的回调后获取
 *
 */
- (NSInteger)eCPM;
@end

NS_ASSUME_NONNULL_END
