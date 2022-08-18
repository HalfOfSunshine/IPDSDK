//
//  H5VC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "H5VC.h"
#import <AVFoundation/AVFoundation.h>

@interface H5VC ()<IPDH5PageDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong) IPDH5Page *ipdH5Page;

@end

@implementation H5VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];

//    @"zjad_h500001iostest",@"J7539616190",@"J6596738679",@"J1009546769",@"J1747131627",@"J1194046705",@"J6060320975"
    if (self.isFirstLoad) {
        [self loadAd:@"zjad_h500001iostest"];
        self.isFirstLoad = NO;
    }
}

-(void) loadAd:(NSString*) adId{
    IPDUser *user = [IPDUser new];
    user.userID = @"00012282";
    user.userName = @"吊炸天524";
    user.userAvatar = @"";
    user.userIntegral = 10000;
    user.ext = @"超级无敌4";
    self.ipdH5Page = [[IPDH5Page alloc] initWithPlacementId:adId user:user delegate:self];
    [self.ipdH5Page loadH5Page];
}

#pragma mark -IPDH5Delegate
//H5Ad加载完成
-(void) onIPDH5PageLoaded:(IPDUser*) user error:(nullable NSError*)error{
    if(!error){
        NSError *error;
            [[AVAudioSession sharedInstance] setActive:NO error:&error];
            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
            [[AVAudioSession sharedInstance] setActive:YES error:&error];
            if(error){
                   
            }
        [self.ipdH5Page presentH5FromRootViewController:self animated:YES];
    }
        
    else{
        NSString *msg =[error.userInfo valueForKey:@"info"];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
       
        [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:NO];
        }])];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

//H5Ad错误
-(void)onIPDH5PageError:(IPDUser*) user error:(NSError*) error{
    NSLog(@"%s",__func__);
}

//广告
//激励视频加载成功
-(void) onIPDH5PageAdRewardLoaded:(IPDUser*) user trans_id:(NSString*) trans_id{
    NSLog(@"%s",__func__);
}
//激励视频触发激励（观看视频大于一定时长或者视频播放完毕）
-(void) onIPDH5PageAdRewardValid:(IPDUser*) user trans_id:(NSString*) trans_id{
    NSLog(@"%s",__func__);
}

//奖励发放,奖励积分
-(void) onIPDH5PageAdRewardProvide:(IPDUser*) user rewardIntegral:(NSInteger) integral{
    NSLog(@"%s",__func__);
}

//奖励发放,奖励积分
-(void) onIPDH5PageAdRewardClick:(IPDUser*) user {
    NSLog(@"%s",__func__);
}
//用户页面的行为操作，倒计时60s结束字段为 stay60s
-(void) onIPDH5PageUserBehavior:(IPDUser*) user behavior:(NSString*) behavior{
    NSLog(@"%s",__func__);
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
