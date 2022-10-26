//
//  IPDWXHelper.h
//  IPDSDKCore
//
//  Created by 麻明康 on 2022/9/27.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, IPDWXApiStatus) {
    IPDWXApiStatusNotIntegration = 0,       //**< 错误或未集成  */
    IPDWXApiStatusNotInstalledWX = 1,        //**< 集成了手机没有安装微信  */
    IPDWXApiStatusReady = 2,         //**< 集成且安装了微信  */
};
@interface IPDWXHelper : NSObject

+ (IPDWXApiStatus)weChatOpenApiStatus;

@end

NS_ASSUME_NONNULL_END
