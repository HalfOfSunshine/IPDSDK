//
//  IPDTubePage.h
//  IPDSDK
//
//  Created by 麻明康 on 2024/6/12.
//  Copyright © 2024 zj. All rights reserved.
//

#import <IPDSDK/IPDSDK.h>
#import "IPDContentPageStateDelegate.h"
#import <IPDSDKCore/IPDContentInfo.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDTubePage : IPDAd <IPDContentInfo>
@property (nonatomic, readonly) UIViewController *viewController;
///视频状态代理
@property (nonatomic, weak) id <IPDContentPageVideoStateDelegate> videoStateDelegate;
///页面状态代理
@property (nonatomic, weak) id <IPDContentPageStateDelegate> stateDelegate;
@end

NS_ASSUME_NONNULL_END
