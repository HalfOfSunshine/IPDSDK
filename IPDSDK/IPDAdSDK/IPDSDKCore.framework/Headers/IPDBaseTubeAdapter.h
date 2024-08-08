//
//  IPDBaseTubeAdapter.h
//  IPDSDKCore
//
//  Created by 麻明康 on 2024/6/11.
//

#import <IPDSDKCore/IPDCoreAdAdapter.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDBaseTubeAdapter : IPDCoreAdAdapter
@property (nonatomic, strong) UIViewController *viewController;
-(void)reportWithEvent:(IPDEventString)event supplementMsg:(nullable NSString *)supplementMsg;

- (void)loadContentPageWithDeeplink:(NSString *)deepLink;

-(void)loadAd NS_UNAVAILABLE;
@end

NS_ASSUME_NONNULL_END
