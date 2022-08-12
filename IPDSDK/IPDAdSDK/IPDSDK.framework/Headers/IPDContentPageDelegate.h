//
//  IPDContentPageDelegate.h
//  IPDSDK
//
//  Created by IpdCoder on 2020/12/22.
//  Copyright © 2020 ipd. All rights reserved.
//

#ifndef IPDContentPageDelegate_h
#define IPDContentPageDelegate_h

typedef NS_ENUM(NSUInteger, IPDContentInfoType) {
    IPDContentInfoTypeUnknown,         //未知，正常不会出现
    IPDContentInfoTypeNormal,          //普通信息流
    IPDContentInfoTypeAd,              //SDK内部广告
    IPDContentInfoTypeEmbeded = 100    //外部广告
};
@class  IPDContentPage;
NS_ASSUME_NONNULL_BEGIN
@protocol IPDContentPageVideoStateDelegate <NSObject>
@optional
/**
 * 视频开始播放
 * @param videoContent 内容模型
 */
- (void)ipd_videoDidStartPlay:(IPDContentPage *)videoContent;
/**
* 视频暂停播放
* @param videoContent 内容模型
*/
- (void)ipd_videoDidPause:(IPDContentPage *)videoContent;
/**
* 视频恢复播放
* @param videoContent 内容模型
*/
- (void)ipd_videoDidResume:(IPDContentPage *)videoContent;
/**
* 视频停止播放
* @param videoContent 内容模型
* @param finished     是否播放完成
*/
- (void)ipd_videoDidEndPlay:(IPDContentPage *)videoContent isFinished:(BOOL)finished;
/**
* 视频播放失败
* @param videoContent 内容模型
* @param error        失败原因
*/
- (void)ipd_videoDidFailedToPlay:(IPDContentPage *)videoContent withError:(NSError *)error;

@end



@protocol IPDContentPageStateDelegate <NSObject>
@optional
/**
* 内容展示
* @param content 内容模型
*/
- (void)ipd_contentDidFullDisplay:(IPDContentPage *)content;
/**
* 内容隐藏
* @param content 内容模型
*/
- (void)ipd_contentDidEndDisplay:(IPDContentPage *)content;
/**
* 内容暂停显示，ViewController disappear或者Application resign active
* @param content 内容模型
*/
- (void)ipd_contentDidPause:(IPDContentPage *)content;
/**
* 内容恢复显示，ViewController appear或者Application become active
* @param content 内容模型
*/
- (void)ipd_contentDidResume:(IPDContentPage *)content;


@end

NS_ASSUME_NONNULL_END

#endif /* IPDContentPageDelegate_h */
