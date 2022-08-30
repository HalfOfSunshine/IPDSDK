//
//  IPDSplashContainerVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/15.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDSplashContainerVC.h"

@interface IPDSplashContainerVC ()

@end

@implementation IPDSplashContainerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.remindLab];
}



-(UILabel *)remindLab{
    if (!_remindLab) {
        _remindLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_W-30, SCREEN_H)];
        _remindLab.text = @"此处需要开发者准备一套默认填充的启动图片";
        _remindLab.textColor = [UIColor redColor];
        _remindLab.font = [UIFont systemFontOfSize:30 weight:UIFontWeightMedium];
        _remindLab.textAlignment = NSTextAlignmentCenter;
        _remindLab.numberOfLines = 5;
    }
    return _remindLab;
}

@end
