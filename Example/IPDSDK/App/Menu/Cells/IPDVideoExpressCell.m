//
//  IPDVideoExpressCell.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/17.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDVideoExpressCell.h"

@implementation IPDVideoExpressCell

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
        self.backgroundColor = [self randomColor];
    }
    return self;
}
- (UIColor *)randomColor{
    NSInteger aRedValue = arc4random()%255;
    NSInteger aGreenValue = arc4random()%255;
    NSInteger aBlueValue = arc4random()%255;
    UIColor *randomColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
    return randomColor;
}

@end
