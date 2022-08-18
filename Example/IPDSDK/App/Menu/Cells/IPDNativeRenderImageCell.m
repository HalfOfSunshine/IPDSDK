//
//  IPDNativeRenderImageCell.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/18.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDNativeRenderImageCell.h"
@implementation IPDNativeRenderImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setupWithUnifiedNativeAdDataObject:(IPDNativeAdObject *)dataObject delegate:(id<IPDNativeAdViewDelegate>)delegate vc:(UIViewController *)vc{
    //配置单图广告
    [self.fillView.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo((SCREEN_W-10)*(@(dataObject.imageHeight).floatValue/@(dataObject.imageWidth).floatValue));
        
    }];
    
    self.fillView.delegate = delegate; // adView 广告回调
    self.fillView.viewController = vc; // 跳转 VC
    [self.fillView registerDataObject:dataObject clickableViews:@[self.fillView]];
    [self.contentView addSubview:self.fillView];
//    self.fillView.logoView.hidden = YES;
}

+ (CGFloat)cellHeightWithUnifiedNativeAdDataObject:(IPDNativeAdObject *)dataObject
{
   CGFloat baseHeigth =  [super cellHeightWithUnifiedNativeAdDataObject:dataObject];
    
    //单图cell
    CGFloat imageHeight = (SCREEN_W-10)*(@(dataObject.imageHeight).floatValue/@(dataObject.imageWidth).floatValue);
    //图片高度+顶部固定高度+底部间隙
    return imageHeight+baseHeigth+8;
}
@end
