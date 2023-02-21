//
//  IPDContentAdapterStateDelegate.h
//  IPDSDKCore
//
//  Created by 麻明康 on 2023/1/6.
//

#import <Foundation/Foundation.h>
#import <IPDSDKCore/IPDContentInfo.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IPDAdapterContentAdapterVideoStateDelegate <NSObject>
@optional
/**
 * 视频开始播放
 * @param videoContent 内容模型
 */
- (void)ipdAdapter_videoDidStartPlay:(id<IPDContentInfo>)videoContent;
/**
* 视频暂停播放
* @param videoContent 内容模型
*/
- (void)ipdAdapter_videoDidPause:(id<IPDContentInfo>)videoContent;
/**
* 视频恢复播放
* @param videoContent 内容模型
*/
- (void)ipdAdapter_videoDidResume:(id<IPDContentInfo>)videoContent;
/**
* 视频停止播放
* @param videoContent 内容模型
* @param finished     是否播放完成
*/
- (void)ipdAdapter_videoDidEndPlay:(id<IPDContentInfo>)videoContent isFinished:(BOOL)finished;
/**
* 视频播放失败
* @param videoContent 内容模型
* @param error        失败原因
*/
- (void)ipdAdapter_videoDidFailedToPlay:(id<IPDContentInfo>)videoContent withError:(NSError *)error;

@end



@protocol IPDContentAdapterStateDelegate <NSObject>
@optional
/**
* 内容展示
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidFullDisplay:(id<IPDContentInfo>)content;
/**
* 内容隐藏
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidEndDisplay:(id<IPDContentInfo>)content;
/**
* 内容暂停显示，ViewController disappear或者Application resign active
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidPause:(id<IPDContentInfo>)content;
/**
* 内容恢复显示，ViewController appear或者Application become active
* @param content 内容模型
*/
- (void)ipdAdapter_contentDidResume:(id<IPDContentInfo>)content;


@end

NS_ASSUME_NONNULL_END
