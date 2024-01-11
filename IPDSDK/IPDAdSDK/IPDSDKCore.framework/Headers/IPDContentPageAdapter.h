//
//  IPDContentPageAdapter.h
//  IPDSDK
//
//  Created by Rare on 2020/12/22.
//  Copyright © 2020 ipd. All rights reserved.
//

#import <IPDSDKCore/IPDBaseContentAdapter.h>
#import <IPDSDKCore/IPDContentInfo.h>
#import <UIKit/UIKit.h>
#import <IPDSDKCore/IPDContentAdapterStateDelegate.h>
#import <IPDSDKCore/IPDContentAdapterStateProtocol.h>


NS_ASSUME_NONNULL_BEGIN

@interface IPDContentPageAdapter : IPDBaseContentAdapter<
IPDContentAdapterStateProtocol,
IPDAdapterContentAdapterVideoStateProtocol
>

/// 任务完成回调
- (void)ipdAdapter_contentTaskComplete:(id<IPDContentInfo>)content;
///  视频状态代理
@property (nonatomic, weak) id <IPDAdapterContentAdapterVideoStateDelegate> ipdAdapter_videoStateDelegate;
///  页面状态代理
@property (nonatomic, weak) id <IPDContentAdapterStateDelegate> ipdAdapter_stateDelegate;

- (void)tryToRefresh;

@end

NS_ASSUME_NONNULL_END
