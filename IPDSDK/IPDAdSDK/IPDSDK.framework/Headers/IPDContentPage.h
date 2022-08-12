//
//  IPDContentPage.h
//  IPDSDK
//
//  Created by IpdCoder on 2020/12/21.
//  Copyright © 2020 ipd. All rights reserved.
//

#import "IPDAd.h"
#import "IPDContentPageDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface IPDContentPage : IPDAd

@property (nonatomic, readonly) UIViewController *viewController;
///视频状态代理
@property (nonatomic, weak) id <IPDContentPageVideoStateDelegate> videoStateDelegate;
///页面状态代理
@property (nonatomic, weak) id <IPDContentPageStateDelegate> stateDelegate;

///内容标识
@property (nonatomic, copy, readonly) NSString *contentInfoId;
///内容类型
@property (nonatomic, assign, readonly) IPDContentInfoType contentInfoType;

///刷新
- (void)tryToRefresh;

@end







NS_ASSUME_NONNULL_END
