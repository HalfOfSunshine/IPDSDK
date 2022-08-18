//
//  ContentPageVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "ContentPageVC.h"
#import <IPDSDK/IPDContentPage.h>
@interface ContentPageVC ()<IPDContentPageVideoStateDelegate,IPDContentPageStateDelegate>
@property (nonatomic,strong)IPDContentPage *contentPage;
@end

@implementation ContentPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentPage = [[IPDContentPage alloc]initWithPlacementId:@"K90010005"];
    self.contentPage.videoStateDelegate = self;
    self.contentPage.stateDelegate = self;
    UIViewController *vc = self.contentPage.viewController;
    if (vc) {
        CGFloat contentY = [UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.frame.size.height;
        vc.view.frame = CGRectMake(0, contentY, self.view.frame.size.width, self.view.frame.size.height-contentY);
        [self addChildViewController:vc];
        [self.view addSubview:vc.view];
    }else{
        UILabel *remindLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 100, SCREEN_W-30, SCREEN_H-100)];
        remindLab.text = @"     视频内容需要快手内容包支持，内容包目前不支持pod导入，请下载sdk，单独手动导入快手模块.\n    其他模块正常pod导入即可，相互不依赖";
        remindLab.numberOfLines = 5;
        [self.view addSubview:remindLab];
    }
    
}

#pragma mark IPDContentPageVideoStateDelegate
/**
 * 视频开始播放
 * @param videoContent 内容模型
 */
- (void)ipd_videoDidStartPlay:(IPDContentPage *)videoContent{
    NSLog(@"%s",__FUNCTION__);
}
/**
* 视频暂停播放
* @param videoContent 内容模型
*/
- (void)ipd_videoDidPause:(IPDContentPage *)videoContent{
    NSLog(@"%s",__FUNCTION__);
}
/**
* 视频恢复播放
* @param videoContent 内容模型
*/
- (void)ipd_videoDidResume:(IPDContentPage *)videoContent{
    NSLog(@"%s",__FUNCTION__);
}
/**
* 视频停止播放
* @param videoContent 内容模型
* @param finished     是否播放完成
*/
- (void)ipd_videoDidEndPlay:(IPDContentPage *)videoContent isFinished:(BOOL)finished{
    NSLog(@"%s",__FUNCTION__);
}
/**
* 视频播放失败
* @param videoContent 内容模型
* @param error        失败原因
*/
- (void)ipd_videoDidFailedToPlay:(IPDContentPage *)videoContent withError:(NSError *)error{
    NSLog(@"%s，%@",__FUNCTION__,error);
}

#pragma mark IPDContentPageStateDelegate

/**
* 内容展示
* @param content 内容模型
*/
- (void)ipd_contentDidFullDisplay:(IPDContentPage *)content{
    NSLog(@"%s",__FUNCTION__);
}
/**
* 内容隐藏
* @param content 内容模型
*/
- (void)ipd_contentDidEndDisplay:(IPDContentPage *)content{
    NSLog(@"%s",__FUNCTION__);
}
/**
* 内容暂停显示，ViewController disappear或者Application resign active
* @param content 内容模型
*/
- (void)ipd_contentDidPause:(IPDContentPage *)content{
    NSLog(@"%s",__FUNCTION__);
}
/**
* 内容恢复显示，ViewController appear或者Application become active
* @param content 内容模型
*/
- (void)ipd_contentDidResume:(IPDContentPage *)content{
    NSLog(@"%s",__FUNCTION__);
}

@end
