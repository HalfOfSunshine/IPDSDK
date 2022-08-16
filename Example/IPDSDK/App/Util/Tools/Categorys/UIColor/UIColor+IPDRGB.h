//
//  UIColor+IPDRGB.h
//  YKXQ
//
//  Created by 麻明康 on 2020/10/22.
//  Copyright © 2020 YiYa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (IPDRGB)
+ (UIColor *) colorFromHexRGB:(NSString *) inColorString;
@end

NS_ASSUME_NONNULL_END
