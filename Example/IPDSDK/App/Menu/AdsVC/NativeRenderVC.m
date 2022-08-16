//
//  NativeRenderVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "NativeRenderVC.h"

@interface NativeRenderVC ()

@end

@implementation NativeRenderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    @"J8595471688",@"J9666281550"
    if (self.isFirstLoad) {
        [self loadAd:@"J8595471688"];
        self.isFirstLoad = NO;
    }
}

-(void) loadAd:(NSString*) adId{

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
