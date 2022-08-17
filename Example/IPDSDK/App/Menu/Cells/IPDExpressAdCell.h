//
//  IPDExpressAdCell.h
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/17.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDExpressAdCell : UITableViewCell
-(void)refreshWithAd:(IPDNativeExpressFeedAd *)ad;
@end

NS_ASSUME_NONNULL_END
