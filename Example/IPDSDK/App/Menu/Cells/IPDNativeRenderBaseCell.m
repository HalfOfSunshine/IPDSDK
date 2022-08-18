//
//  IPDNativeRenderBaseCell.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/18.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDNativeRenderBaseCell.h"

@implementation IPDNativeRenderBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}


- (void)setupWithUnifiedNativeAdDataObject:(IPDNativeAdObject *)dataObject delegate:(id<IPDNativeAdViewDelegate>)delegate vc:(UIViewController *)vc{
    
}

+ (CGFloat)cellHeightWithUnifiedNativeAdDataObject:(IPDNativeAdObject *)dataObject{
    
    return IPDNativeTopHeight;
}

- (void)setModel:(IPDNativeAdObject *)model{
    _model = model;
    
}

-(IPDFillNativeAdView *)fillView{
    if (!_fillView) {
        _fillView= [[IPDFillNativeAdView alloc]initWithFrame:self.contentView.bounds];
        
    }
    return _fillView;
}
-(void)dealloc{
    [_fillView unregisterDataObject];
}
@end
