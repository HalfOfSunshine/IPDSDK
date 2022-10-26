//
//  IPDMiniParamAdAdapter.h
//  IPDSDKCore
//
//  Created by 麻明康 on 2022/9/28.
//

#import "IPDCoreAdAdapter.h"
#import "IPDMiniParamAdProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@class IPDMiniParamAdAdapter;
@protocol IPDMiniParamAdAdapterDelegate <NSObject>
@optional
/**
 *  小程序唤起成功
 */
- (void)ipd_miniParamAdAdapterDidAwake:(IPDMiniParamAdAdapter *)miniParamAdAdapter;


/**
 *  小程序唤起失败
 */
- (void)ipd_miniParamAdAdapterAwakeFail:(IPDMiniParamAdAdapter *)miniParamAdAdapter error:(NSError *)error;

- (void)ipd_miniParamAdAdapter:(IPDMiniParamAdAdapter *)miniParamAdAdapter onResp:(id)resp;
@end
@interface IPDMiniParamAdAdapter : IPDCoreAdAdapter<IPDMiniParamAdProtocol>
@property (nonatomic, weak) id <IPDMiniParamAdAdapterDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
