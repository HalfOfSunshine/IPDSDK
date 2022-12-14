//
//  IPDAppDelegate+IPDSDKRegiester.h
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/12.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDAppDelegate.h"
#import <UIKit/UIKit.h>
#import <IPDSDK/IPDSDK.h>
#import <objc/message.h>
NS_ASSUME_NONNULL_BEGIN

@interface IPDAppDelegate (IPDSDKRegiester)<IPDSplashAdDelegate>
@property (nonatomic, strong) IPDSplashAd *splashAd;
@property (nonatomic, strong) UIView *bottomView;
-(void)setupIPDSDK;
-(void)showSplashAd;
@end

NS_ASSUME_NONNULL_END
