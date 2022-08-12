//
//  IPDAd.h
//  IPDSDK
//
//  Created by IpdCoder on 2022/8/11.
//  Copyright © 2022 ipd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <IPDSDKCore/IPDAdDebugLog.h>
#import <IPDSDKCore/NSError+IPDAd.h>


NS_ASSUME_NONNULL_BEGIN

@interface IPDAd : NSObject

@property(nonatomic,copy,readonly) NSString *placementId;
/**
*  构造方法
*  详解：placementId - 广告位 ID
*/
- (instancetype)initWithPlacementId:(NSString *)placementId;



- (NSArray *)getFillFailureMessages;

@end

NS_ASSUME_NONNULL_END
