//
//  IPDSDKAdEnum.h
//  IPDSDKCore
//
//  Created by IpdCoder on 2021/8/16.
//

#ifndef IPDSDKAdEnum_h
#define IPDSDKAdEnum_h



typedef NS_ENUM(NSUInteger, IPDMediaPlayerStatus) {
    IPDMediaPlayerStatusDefalt = 0,         // 初始状态
    IPDMediaPlayerStatusLoading = 1,         // 加载中
    IPDMediaPlayerStatusPlaying = 2,         // 开始播放
    IPDMediaPlayerStatusPaused = 3,          // 用户行为导致暂停
    IPDMediaPlayerStatusError = 4,           // 播放出错
    IPDMediaPlayerStatusStoped = 5,          // 播放停止
};


typedef NS_ENUM(NSInteger,IPDAdSDKLogLevel){
    IPDAdSDKLogLevelNone,
    IPDAdSDKLogLevelDebug,
    IPDAdSDKLogLevelWarning,
    IPDAdSDKLogLevelError,
};

typedef NS_ENUM(NSInteger, IPDAdPlatformType) {
    IPDAdPlatform_None,
    IPDAdPlatform_CSJ,
    IPDAdPlatform_GDT,
    IPDAdPlatform_MTG,
    IPDAdPlatform_KS,
    IPDAdPlatform_IPD,
    IPDAdPlatform_YM,
    IPDAdPlatform_SIG,
    IPDAdPlatform_WW,
    IPDAdPlatform_Google,
    IPDAdPlatform_Baidu,
};



#endif /* IPDSDKAdEnum_h */
