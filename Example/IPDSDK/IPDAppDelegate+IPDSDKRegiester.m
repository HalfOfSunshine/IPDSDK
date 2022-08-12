//
//  IPDAppDelegate+IPDSDKRegiester.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/12.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDAppDelegate+IPDSDKRegiester.h"

@implementation IPDAppDelegate (IPDSDKRegiester)
//zj_20201014iOSDEMO

- (void)regiestIPDSDK{
    [IPDAdSDK setAppID:@"zj_20201014iOSDEMO"];
}

#pragma mark =============== getter&setter ===============
- (IPDSplashAd*)splashAd{
    return objc_getAssociatedObject(self, @selector(splashAd));
}

- (void)setSplashAd:(IPDSplashAd *)splashAd{
    objc_setAssociatedObject(self, @selector(splashAd), splashAd,OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (UIView *)bottomView{
    return objc_getAssociatedObject(self, @selector(bottomView));
}
- (void)setBottomView:(UIView *)bottomView{
    objc_setAssociatedObject(self, @selector(bottomView), bottomView,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIWindow *)showWindow{
    UIWindow *_showWindow = objc_getAssociatedObject(self, @selector(showWindow));
    if (!_showWindow) {
        _showWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _showWindow.windowLevel = UIWindowLevelAlert +10000;
        _showWindow.backgroundColor = [UIColor clearColor];
//        _showWindow.rootViewController = [[IPDSplashWindowVC alloc]init];
    }
    return _showWindow;
}
- (void)setShowWindow:(UIWindow *)showWindow{
    objc_setAssociatedObject(self, @selector(showWindow), showWindow,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
