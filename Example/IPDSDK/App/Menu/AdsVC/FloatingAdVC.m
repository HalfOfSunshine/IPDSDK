//
//  FloatingAdVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "FloatingAdVC.h"

@interface FloatingAdVC ()<IPDFloatingAdViewDelegate>
@property (nonatomic,strong)IPDFloatingAdView *floatingAd;

@end

@implementation FloatingAdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    if (self.isFirstLoad) {
        [self loadAd:@"J2952950117"];
        self.isFirstLoad = NO;
    }
}

-(void) loadAd:(NSString*) adId{
    self.floatingAd = [[IPDFloatingAdView alloc]initWithPlacementId:adId frame:CGRectZero];
    self.floatingAd.delegate = self;
    self.floatingAd.backImage = [UIImage imageNamed:@"ipd_h5_back"];
    self.floatingAd.hiddenH5CloseButton = YES;
    self.floatingAd.closeText = [[NSAttributedString alloc]initWithString:@"关闭" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    [self.floatingAd loadAd];
}

-(void)ipd_floatingAdViewDidLoad:(IPDFloatingAdView *)floatingAdView{
    NSLog(@"%s",__FUNCTION__);
    [self.view addSubview:floatingAdView];
}

-(void)ipd_floatingAdViewError:(IPDFloatingAdView *)floatingAdView error:(NSError *)error{
    NSLog(@"%s",__FUNCTION__);
}

-(void)ipd_floatingAdViewDidClick:(IPDFloatingAdView *)floatingAdView{
    NSLog(@"%s",__FUNCTION__);
}

-(void)ipd_floatingAdViewDidClose:(IPDFloatingAdView *)floatingAdView{
    NSLog(@"%s",__FUNCTION__);
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
