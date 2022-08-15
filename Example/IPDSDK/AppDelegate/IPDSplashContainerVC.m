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
    [self.view addSubview:self.splashBgImageView];
    self.view.backgroundColor = [UIColor redColor];
    
}



-(UIImageView *)splashBgImageView{
    if (!_splashBgImageView) {
        _splashBgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _splashBgImageView.image = [UIImage imageNamed:@"SplashBgX"];
        
    }
    return _splashBgImageView;
}

@end
