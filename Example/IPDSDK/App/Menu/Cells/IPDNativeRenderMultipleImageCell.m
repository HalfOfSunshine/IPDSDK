//
//  IPDNativeRenderMultipleImageCell.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/18.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDNativeRenderMultipleImageCell.h"

@implementation IPDNativeRenderMultipleImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setupWithUnifiedNativeAdDataObject:(IPDNativeAdObject *)dataObject delegate:(id<IPDNativeAdViewDelegate>)delegate vc:(UIViewController *)vc{
    
    
    self.fillView.viewController = vc;
    self.fillView.delegate = delegate;
    if (!self.fillView) {
        CGFloat imageWidth = (SCREEN_W-20)/3.0;
        CGFloat imageHeight = imageWidth *(@(dataObject.imageHeight).floatValue/@(dataObject.imageWidth).floatValue);
        for (int i = 0; i<dataObject.mediaUrlList.count; i++) {
            NSString *urlString = dataObject.mediaUrlList[i];
            //行
            NSInteger line =floorf(i/3.0);
            //y
            CGFloat y = IPDNativeTopHeight+(line *(imageHeight+5));
            //每一行的位置
            NSInteger index = i - line*3;
            CGFloat x =  5*(index+1)+imageWidth*index;
            
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.frame = CGRectMake(x,y, imageWidth,imageHeight);
            [imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
            [self.fillView addSubview:imageView];
        }
        
        
        [self.fillView registerDataObject:dataObject clickableViews:@[self.fillView]];
        [self.contentView addSubview:self.fillView];
        
//        self.fillView.logoView.hidden = YES;
    }
}

+ (CGFloat)cellHeightWithUnifiedNativeAdDataObject:(IPDNativeAdObject *)dataObject
{
    CGFloat baseHeigth =  [super cellHeightWithUnifiedNativeAdDataObject:dataObject];
    CGFloat imageWidth = (SCREEN_W-20)/3.0;
    CGFloat imageHeight = imageWidth *(@(dataObject.imageHeight).floatValue/@(dataObject.imageWidth).floatValue);
    NSInteger totalLine =ceilf(dataObject.mediaUrlList.count/3.0);
    CGFloat totalHeight = totalLine *(imageHeight+5);
    return totalHeight +baseHeigth+8;
}
@end
