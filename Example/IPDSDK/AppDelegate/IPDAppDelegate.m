//
//  IPDAppDelegate.m
//  IPDSDK
//
//  Created by Mountain King on 08/12/2022.
//  Copyright (c) 2022 Mountain King. All rights reserved.
//

#import "IPDAppDelegate.h"
#import "IPDAppDelegate+IPDSDKRegiester.h"
#import "IPDMainViewController.h"
#import "IPDSplashContainerVC.h"
@implementation IPDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // adaptor for Customer Event
    [self setupIPDSDK];
    [self showSplashAd];
    
    if (self.window == nil) {
        IPDMainViewController *mainViewController = [[IPDMainViewController alloc] init];
        UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:mainViewController];
        UIWindow *keyWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [keyWindow makeKeyAndVisible];
        self.window = keyWindow;
        self.window.rootViewController = navigationVC;
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark =============== LazyLoad ===============
-(UIWindow*) showWindow{
    if(!_showWindow){
        _showWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _showWindow.windowLevel = UIWindowLevelAlert +10000;
        _showWindow.backgroundColor = [UIColor clearColor];
        _showWindow.rootViewController = [[IPDSplashContainerVC alloc]init];
    }
    return _showWindow;
}

@end
