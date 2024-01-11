//
//  IPDSDKDefines.h
//  IPDOptimizeProject
//
//  Created by IpdCoder on 2021/7/29.
//
#import <UIKit/UIKit.h>

#ifndef IPDSDKDefines_h
#define IPDSDKDefines_h

#define IPD_ScreenHeight [UIScreen mainScreen].bounds.size.height

#define IPD_ScreenWidth [UIScreen mainScreen].bounds.size.width

#define IPD_BANNED_TIME @"BANNED_TIME"
#define IPD_StatusBarHeight \
({CGFloat statusBarHeight = 0; \
if (@available(iOS 13.0, *))  { \
UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;\
statusBarHeight = statusBarManager.statusBarFrame.size.height;\
} else {\
statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;\
} \
(statusBarHeight);})

#define IPD_IPHONEXSeries ipd_is_iphoneXSeries_screen()

#define IPD_DefaultNavigationBarHeight \
({CGFloat navigationBarHeight = 44; \
if (IPD_IPHONEXSeries)  { \
navigationBarHeight = 44+IPD_SafeAreaInsetsTop; \
}else{ \
navigationBarHeight = 44+IPD_StatusBarHeight; \
} \
(navigationBarHeight);})

#define IPD_SafeAreaInsetsBottom \
({CGFloat bottom = 0; \
if (@available(iOS 11.0, *))  { \
bottom = ipd_visibleWindow().safeAreaInsets.bottom; \
} \
(bottom);})

#define IPD_SafeAreaInsetsTop \
({CGFloat top = 0; \
if (@available(iOS 11.0, *)) { \
top = ipd_visibleWindow().safeAreaInsets.top; \
} \
(top);})


/**---------------------------------------------------*/
//强弱引用转换，用于解决代码块（block）与强引用对象之间的循环引用问题
//弱引用
#define ipd_weakify(object)  __weak typeof(object) weak##object = object;
//强引用
#define ipd_strongify(object)  __strong typeof(object) object = weak##object;
/**---------------------------------------------------*/


FOUNDATION_EXPORT UIWindow * ipd_visibleWindow(void);

FOUNDATION_EXPORT BOOL ipd_is_iphoneXSeries_screen(void);

FOUNDATION_EXPORT UIViewController * ipd_getCurrentVC(void);
FOUNDATION_EXPORT UIViewController * ipd_getCurrentVCFrom(UIViewController *vc);

FOUNDATION_EXPORT NSString * const IPDSDKVersion;

FOUNDATION_EXPORT NSNumber * getIPDSDKPlugVer (void);
#endif /* IPDSDKDefines_h */
