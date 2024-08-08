//
//  IPDTubePageAdapter.h
//  IPDSDKCore
//
//  Created by 麻明康 on 2024/6/12.
//

#import "IPDBaseTubeAdapter.h"
#import <IPDSDKCore/IPDContentInfo.h>
#import <IPDSDKCore/IPDContentAdapterStateDelegate.h>
#import <IPDSDKCore/IPDContentAdapterStateProtocol.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDTubePageAdapter : IPDBaseTubeAdapter<
IPDContentAdapterStateProtocol,
IPDAdapterContentAdapterVideoStateProtocol
>
/// 任务完成回调
- (void)ipdAdapter_contentTaskComplete:(id<IPDContentInfo>)content;
///  视频状态代理
@property (nonatomic, weak) id <IPDAdapterContentAdapterVideoStateDelegate> ipdAdapter_videoStateDelegate;
///  页面状态代理
@property (nonatomic, weak) id <IPDContentAdapterStateDelegate> ipdAdapter_stateDelegate;
@end

NS_ASSUME_NONNULL_END
