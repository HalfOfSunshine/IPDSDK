//
//  IPDAdEventReport.h
//  IPDSDKCore
//
//  Created by Rare on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "IPDAdBaseNetworking.h"
#import "NSError+IPDAd.h"
#import <IPDSDKCore/IPDSDKAdEnum.h>
NS_ASSUME_NONNULL_BEGIN

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
+ (nullable NSURLSessionTask *)reportEventWithIpdad_id:(NSString *)Ipdad_id adType:(IPDAdType)adType event:(IPDEventString)event unionType:(NSString *)unionType ipd_pm_id:(NSString *)Ipd_pm_id supplementMsg:(NSString * _Nullable )supplementMsg otherDic:(NSDictionary * _Nullable)otherDic callback:(void(^)(_Nullable id responseObject, NSError * _Nullable error))callback;



+ (NSString *)getTimestampSince1970;

@end

NS_ASSUME_NONNULL_END
