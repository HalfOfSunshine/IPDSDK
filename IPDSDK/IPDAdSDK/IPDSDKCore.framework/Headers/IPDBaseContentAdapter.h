//
//  IPDBaseContentAdapter.h
//  IPDSDKCore
//
//  Created by 麻明康 on 2023/1/4.
//

#import <IPDSDKCore/IPDCoreAdAdapter.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDBaseContentAdapter : IPDCoreAdAdapter

@property (nonatomic, strong) UIViewController *viewController;

- (void)loadContentPageWithDeeplink:(NSString *)deepLink;

-(void)loadAd NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
