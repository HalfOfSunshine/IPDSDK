//
//  IPDNativeRenderBaseCell.h
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/18.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IPDFillNativeAdView.h"
#import "View+MASAdditions.h"
#import "SDWebImage.h"

NS_ASSUME_NONNULL_BEGIN
#define IPDNativeTopHeight (45+5+10)

@interface IPDNativeRenderBaseCell : UITableViewCell
@property (nonatomic, strong) IPDNativeAdObject *model;


@property (nonatomic,strong)IPDFillNativeAdView *fillView;
- (void)setupWithUnifiedNativeAdDataObject:(IPDNativeAdObject *)dataObject delegate:(id<IPDNativeAdViewDelegate>)delegate vc:(UIViewController *)vc;

+ (CGFloat)cellHeightWithUnifiedNativeAdDataObject:(IPDNativeAdObject *)dataObject;
@end

NS_ASSUME_NONNULL_END
