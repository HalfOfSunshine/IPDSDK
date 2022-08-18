//
//  IPDFillNativeAdView.h
//  IPDSDKDemo
//
//  Created by IpdCoder on 2021/3/30.
//  Copyright © 2021 ipd. All rights reserved.
//

#import <IPDSDKCore/IPDNativeAdView.h>

NS_ASSUME_NONNULL_BEGIN



@interface IPDFillNativeAdView : IPDNativeAdView


@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *clickButton;

@property (nonatomic, strong) UIImageView *appIconImageView;


@end

NS_ASSUME_NONNULL_END
