//
//  IPDFeedPage.h
//  IPDSDK
//
//  Created by 麻明康 on 2023/1/4.
//  Copyright © 2023 ipd. All rights reserved.
//

#import "IPDAd.h"
#import "IPDContentPageStateDelegate.h"
#import <IPDSDKCore/IPDContentInfo.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDFeedPage : IPDAd <IPDContentInfo>
@property (nonatomic, readonly) UIViewController *viewController;
///视频状态代理
@property (nonatomic, weak) id <IPDContentPageVideoStateDelegate> videoStateDelegate;
///页面状态代理
@property (nonatomic, weak) id <IPDContentPageStateDelegate> stateDelegate;

@end

NS_ASSUME_NONNULL_END
