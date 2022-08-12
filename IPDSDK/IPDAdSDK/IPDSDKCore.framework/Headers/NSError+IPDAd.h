//
//  NSError+IPDAd.h
//  IPDSDKCore
//
//  Created by IpdCoder on 2021/6/9.


#import <Foundation/Foundation.h>
#import <IPDSDKCore/IPDAdUnionItemModel.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,IPDErrorCodeAd){
    IPDErrorCodeAd_Unknown = 100100,
    IPDErrorCodeAd_Timeout = 100200,
    IPDErrorCodeAd_LackLibraries = 100201,
    IPDErrorCodeAd_AdId = 100202,
    IPDErrorCodeAd_is_being_limit = 100301
};


@interface NSError (IPDAd)


+ (NSError *)ipdAdError_errorWithCode:(IPDErrorCodeAd)code adItemConfig:(nullable IPDAdUnitModel *)adItemConfig userInfo:(nullable NSDictionary<NSString *, id> *)dict;


- (NSDictionary *)convertDictionary;


- (NSString *)convertJSONString;

@end

NS_ASSUME_NONNULL_END
