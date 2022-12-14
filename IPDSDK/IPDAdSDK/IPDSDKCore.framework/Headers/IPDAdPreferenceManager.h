//
//  IPDAdPreferenceManager.h
//  IPDSDKCore
//
//  Created by IpdCoder on 2022/2/23.
//

#import <Foundation/Foundation.h>
#import "IPDAdUnionItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface IPDAdPreferenceManager : NSObject

@property (nonatomic, strong, nullable, readonly) IPDAdUnionItemModel *currentPDItem;
@property (nonatomic, strong, nullable, readonly) NSArray <IPDAdUnitModel *>*currentBDItems;

@property (nonatomic,assign, readonly)NSInteger currentLevel;
@property (nonatomic,assign, readonly)NSInteger totalLevels;


@property (nonatomic, strong, nullable, readonly) NSArray <IPDAdUnionItemModel *>*pdItems;


/**获取pd和bd广告
 positionId : 广告位置id
 isFirst是否是首次获取  isFirst == YES 才会调用
 */
- (void)getAdItemsWithPositionId:(NSString *)positionId isFirst:(BOOL)isFirst;


///判断是否有下一个层广告 并刷新到下移除
- (BOOL)hasNextLevelAndRefresh;


- (NSInteger)weightWithAdItems:(NSArray <IPDAdUnitModel *>*)adItems;


//是否有广告数据
- (BOOL)hasAdDatas;


//广告类型获取广告位id
+(NSString *)getAdDefaultPlacementId:(NSString *)adType;


@end

NS_ASSUME_NONNULL_END
