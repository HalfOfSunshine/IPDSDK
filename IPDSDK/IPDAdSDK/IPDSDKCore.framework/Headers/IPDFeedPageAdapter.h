//
//  IPDFeedPageAdapter.h
//  IPDSDK
//
//  Created by Rare on 2020/12/22.
//  Copyright © 2020 ipd. All rights reserved.
//

#import <IPDSDKCore/IPDBaseContentAdapter.h>
#import <UIKit/UIKit.h>
#import <IPDSDKCore/IPDContentInfo.h>
#import <IPDSDKCore/IPDContentAdapterStateDelegate.h>
#import <IPDSDKCore/IPDContentAdapterStateProtocol.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDFeedPageAdapter : IPDBaseContentAdapter<
IPDContentAdapterStateProtocol,
IPDAdapterContentAdapterVideoStateProtocol
>

///  视频状态代理
@property (nonatomic, weak) id <IPDAdapterContentAdapterVideoStateDelegate> ipdAdapter_videoStateDelegate;
///  页面状态代理
@property (nonatomic, weak) id <IPDContentAdapterStateDelegate> ipdAdapter_stateDelegate;

@end
NS_ASSUME_NONNULL_END
