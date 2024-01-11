//
//  IPDAdSDK.h
//  IPDSDK
//
//  Created by IpdCoder on 2022/8/11.
//  Copyright © 2022 ipd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IPDSDKCore/IPDSDKAdEnum.h>
NS_ASSUME_NONNULL_BEGIN

@interface IPDAdSDK : NSObject

/**
Register the App ID
@param appID : the unique identifier of the App
*/
+ (void)setAppID:(NSString *)appID;


/**
Register the App ID that’s already been applied from operation specialist
@param appID : the unique identifier of the App
@param callback completed info
*/
+ (void)setAppID:(NSString *)appID callback:(void(^)(BOOL completed, NSDictionary *info))callback;

/**
 Configure development mode.
 @param level : default IPDAdSDKLogLevelNone
 */
+ (void)setLogLevel:(IPDAdSDKLogLevel)level;


/**
 SDK Version
*/
+ (NSString *)SDKVersion;

/**
 appId
*/
+ (NSString *)appId;


@end

NS_ASSUME_NONNULL_END
