//
//  IPDExpressAdCell.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/17.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDExpressAdCell.h"
#import "View+MASAdditions.h"
@implementation IPDExpressAdCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)refreshWithAd:(IPDNativeExpressFeedAd *)ad{
    UIView *view = [self.contentView viewWithTag:100];
    [view removeFromSuperview];
    ad.feedView.tag = 100;
//    [feedAd setVideoSoundEnable:soundEnable];
    [self.contentView addSubview:ad.feedView];
    [ad.feedView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
