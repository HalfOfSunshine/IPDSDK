//
//  IPDAdEventReport.h
//  IPDSDKCore
//
//  Created by IpdCoder on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "IPDAdBaseNetworking.h"
#import "NSError+IPDAd.h"
NS_ASSUME_NONNULL_BEGIN

typedef NSString *IPDReportAdTypeString NS_STRING_ENUM;
FOUNDATION_EXPORT NSString * const IPDAdType_SPLASH;//开屏
FOUNDATION_EXPORT NSString * const IPDAdType_REWARD;//激励视频
FOUNDATION_EXPORT NSString * const IPDAdType_H5;//H5
FOUNDATION_EXPORT NSString * const IPDAdType_Banner;//banner
FOUNDATION_EXPORT NSString * const IPDAdType_Interstitial;//插屏
FOUNDATION_EXPORT NSString * const IPDAdType_ExpressFullVideoFeed;//视频流 
FOUNDATION_EXPORT NSString * const IPDAdType_ContentVideo;//视频内容 
FOUNDATION_EXPORT NSString * const IPDAdType_NativeExpress;//信息流 
FOUNDATION_EXPORT NSString * const IPDAdType_Native;//原生渲染 
FOUNDATION_EXPORT NSString * const IPDAdType_FullScreenVideo;//全屏视频

typedef NSString *IPDEventString NS_STRING_ENUM;
FOUNDATION_EXPORT NSString * const IPDEvent_START;//开始调用
FOUNDATION_EXPORT NSString * const IPDEvent_Load;//加载成功
FOUNDATION_EXPORT NSString * const IPDEvent_Show;//展示成功
FOUNDATION_EXPORT NSString * const IPDEvent_Finish;//完成
FOUNDATION_EXPORT NSString * const IPDEvent_Click;//点击
FOUNDATION_EXPORT NSString * const IPDEvent_Error;//错误
FOUNDATION_EXPORT NSString * const IPDEvent_Other;//其他信息


@interface IPDAdEventReport : IPDAdBaseNetworking

//事件上报
+ (nullable NSURLSessionTask *)reportEventWithIpdad_id:(NSString *)ipdad_id adType:(IPDReportAdTypeString)adType event:(IPDEventString)event unionType:(NSString *)unionType ipd_pm_id:(NSString *)ipd_pm_id supplementMsg:(NSString * _Nullable )supplementMsg otherDic:(NSDictionary * _Nullable)otherDic callback:(void(^)(_Nullable id responseObject, NSError * _Nullable error))callback;



+ (NSString *)getTimestampSince1970;

@end

NS_ASSUME_NONNULL_END
