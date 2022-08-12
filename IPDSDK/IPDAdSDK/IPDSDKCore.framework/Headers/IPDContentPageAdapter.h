//
//  IPDContentPageAdapter.h
//  IPDSDK
//
//  Created by IpdCoder on 2020/12/22.
//  Copyright © 2020 ipd. All rights reserved.
//

#import <IPDSDKCore/IPDCoreAdAdapter.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IPDAdapterContentAdapterVideoStateDelegate,IPDContentAdapterStateDelegate;

@interface IPDContentPageAdapter : IPDCoreAdAdapter

@property (nonatomic, strong) UIViewController *viewController;

///  视频状态代理
@property (nonatomic, weak) id <IPDAdapterContentAdapterVideoStateDelegate> ipdAdapter_videoStateDelegate;
///  页面状态代理
@property (nonatomic, weak) id <IPDContentAdapterStateDelegate> ipdAdapter_stateDelegate;


- (void)loadContentPageWithDeeplink:(NSString *)deepLink;

- (void)tryToRefresh;


//内容标识
@property (nonatomic,copy)NSString *contentInfoId;
//内容类型
//IPDContentInfoTypeUnknown = 0,         //未知，正常不会出现
// IPDContentInfoTypeNormal = 1,          //普通信息流
// IPDContentInfoTypeAd = 2,              //SDK内部广告
//IPDContentInfoTypeEmbeded = 100    //外部广告
@property (nonatomic,assign)NSInteger contentInfoType;

/**
 * 视频开始播放
 * @param videoContent 内容模型
 */
- (void)ipdAdapter_videoDidStartPlay:(IPDContentPageAdapter *)videoContent;
/**
* 视频暂停播放
* @param videoContent 内容模型
*/
- (void)ipdAdapter_videoDidPause:(IPDContentPageAdapter *)videoContent;
/**
* 视频恢复播放
* @param videoContent 内容模型
*/
- (void)ipdAdapter_videoDidResume:(IPDContentPageAdapter *)videoContent;
/**
* 视频停止播放
* @param videoContent 内容模型
* @param finished     是否播放完成
*/
- (void)ipdAdapter_videoDidEndPlay:(IPDContentPageAdapter *)videoContent isFinished:(BOOL)finished;
/**
* 视频播放失败
* @param videoContent 内容模型
* @param error        失败原因
*/
- (void)ipdAdapter_videoDidFailedToPlay:(IPDContentPageAdapter *)videoContent withError:(NSError *)error;


/**
* 内容展示
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidFullDisplay:(IPDContentPageAdapter *)content;
/**
* 内容隐藏
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidEndDisplay:(IPDContentPageAdapter *)content;
/**
* 内容暂停显示，ViewController disappear或者Application resign active
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidPause:(IPDContentPageAdapter *)content;
/**
* 内容恢复显示，ViewController appear或者Application become active
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidResume:(IPDContentPageAdapter *)content;


-(void)loadAd NS_UNAVAILABLE;

@end



@protocol IPDAdapterContentAdapterVideoStateDelegate <NSObject>
@optional
/**
 * 视频开始播放
 * @param videoContent 内容模型
 */
- (void)ipdAdapter_videoDidStartPlay:(IPDContentPageAdapter *)videoContent;
/**
* 视频暂停播放
* @param videoContent 内容模型
*/
- (void)ipdAdapter_videoDidPause:(IPDContentPageAdapter *)videoContent;
/**
* 视频恢复播放
* @param videoContent 内容模型
*/
- (void)ipdAdapter_videoDidResume:(IPDContentPageAdapter *)videoContent;
/**
* 视频停止播放
* @param videoContent 内容模型
* @param finished     是否播放完成
*/
- (void)ipdAdapter_videoDidEndPlay:(IPDContentPageAdapter *)videoContent isFinished:(BOOL)finished;
/**
* 视频播放失败
* @param videoContent 内容模型
* @param error        失败原因
*/
- (void)ipdAdapter_videoDidFailedToPlay:(IPDContentPageAdapter *)videoContent withError:(NSError *)error;

@end



@protocol IPDContentAdapterStateDelegate <NSObject>
@optional
/**
* 内容展示
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidFullDisplay:(IPDContentPageAdapter *)content;
/**
* 内容隐藏
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidEndDisplay:(IPDContentPageAdapter *)content;
/**
* 内容暂停显示，ViewController disappear或者Application resign active
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidPause:(IPDContentPageAdapter *)content;
/**
* 内容恢复显示，ViewController appear或者Application become active
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidResume:(IPDContentPageAdapter *)content;


@end

NS_ASSUME_NONNULL_END
