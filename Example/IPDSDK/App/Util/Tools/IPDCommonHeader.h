//
//  IPDCommonHeader.h
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#ifndef IPDCommonHeader_h
#define IPDCommonHeader_h
#pragma mark =============== Frame ===============
//屏幕的宽度
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
//屏幕的高度
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

//导航栏的高
#define NavigationBar_H  self.navigationController.navigationBar.frame.size.height
//状态栏的高
#define StatusBar_H      [UIApplication sharedApplication].statusBarFrame.size.height
//导航栏+状态栏的高
#define TopBar_H      (NavigationBar_H+StatusBar_H)
//同上
#define Navigation_H      (NavigationBar_H+StatusBar_H)

//标签栏的高
#define TabBar_H     self.tabBarController.tabBar.frame.size.height

//屏幕边距
#define SCREEN_PD 15.
//判断是否是iPhoneX
#define  iPhoneX     ({\
    BOOL result = NO;\
        if (@available(iOS 11.0, *)) {\
            UIEdgeInsets safeAreaInsets = [UIApplication sharedApplication].windows[0].safeAreaInsets;\
            result = !(safeAreaInsets.bottom == 0);\
        }\
        (result);\
    })

//等比换算宽高
#define SwitchX(x) ((SCREEN_W/414)*(x))
#define SwitchY(y) ((SCREEN_H/896)*(y))

//屏幕底部安全距离
#define SafeAreaBottomHeight ({\
    CGFloat result = 0.;\
    if (@available(iOS 11.0, *)) {\
        UIEdgeInsets safeAreaInsets = [UIApplication sharedApplication].windows[0].safeAreaInsets;\
        result = (safeAreaInsets.bottom != 0)?safeAreaInsets.bottom:0;\
    }\
    (result);\
})

#define SafeAreaStatusHeight  ({\
    CGFloat result = 20.;\
    if (@available(iOS 11.0, *)) {\
        UIEdgeInsets safeAreaInsets = [UIApplication sharedApplication].windows[0].safeAreaInsets;\
        result = (safeAreaInsets.top != 0)?safeAreaInsets.top:20;\
    }\
    (result);\
})


#pragma mark =============== Colors ===============
//RGB颜色
#define ColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define ColorRGB(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

//十六进制颜色
#define ColorHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#pragma mark === Some wonderful color
#define     Tiffany_Blue        ColorRGB(129.,216.,207.,1)
#define     Avocado_Green       ColorRGB(102.,153.,51.,1)
#define     NF_Blue             ColorHEX(0x40c2c2)

#pragma mark === Theme color
#define     MainColor           ColorHEX(0xB22222)
#define     BlueColor           ColorHEX(0x40c2c2)
#define     Text_Color_Black    ColorHEX(0x303133)
#define     Text_Color_Gray     ColorHEX(0x909399)

#endif /* IPDCommonHeader_h */
