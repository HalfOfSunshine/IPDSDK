//
//  VideoExpressAdVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "VideoExpressAdVC.h"
#import "IPDVideoExpressCell.h"
#import "IPDVideoExpressAdCell.h"

@interface VideoExpressAdVC ()<UITableViewDataSource,UITableViewDelegate,IPDFeedFullVideoProviderDelegate>
@property (strong, nonatomic) UITableView *table;
@property (nonatomic, copy) NSMutableArray *dataArray;

@property(nonatomic,strong) IPDFeedFullVideoProvider *adProvider;
@end

@implementation VideoExpressAdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self.view addSubview:self.table];
    [self addBackButton];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    if (self.isFirstLoad) {
        [self loadAd:@"Pl1qeofsq42g"];
        self.isFirstLoad = NO;
    }
}
#pragma mark =============== Ads ===============

-(void) loadAd:(NSString*) adId{
    if(!self.adProvider){
        self.adProvider = [[IPDFeedFullVideoProvider alloc] initWithPlacementId:adId];
        self.adProvider.delegate = self;
        self.adProvider.adSize = CGSizeMake(SCREEN_W, SCREEN_H);
    }
    [self.adProvider loadAd:6];
}
#pragma mark IPDFeedFullVideoProviderDelegate
/**
 * 广告加载成功
 */
- (void)ipd_feedFullVideoProviderLoadSuccess:(IPDFeedFullVideoProvider *)provider views:(NSArray<__kindof IPDFeedFullVideoView *> *)views{
    if (views.count) {
        NSMutableArray *dataSources = [NSMutableArray arrayWithCapacity:0];
        [views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            IPDFeedFullVideoView *videoView = (IPDFeedFullVideoView *)obj;
            videoView.rootViewController = self;
            // important: 此处会进行WKWebview的渲染，建议一次最多预加载三个广告，如果超过3个会很大概率导致WKWebview渲染失败。
            [videoView render];
            [dataSources addObject:videoView];
            [dataSources addObject:@"App tableViewcell"];
        }];
        self.dataArray = [dataSources copy];
    }
    [self.table reloadData];
}



/**
* 广告加载失败
*/
- (void)ipd_feedFullVideoProviderLoadFail:(IPDFeedFullVideoProvider *)provider error:(NSError *_Nullable)error{
    NSLog(@"error:%@",error);
}

/**
 * 广告渲染成功, IPDFeedFullVideoView.size.height has been updated
 */
- (void)ipd_feedFullVideoAdViewRenderSuccess:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView{
    
}

/**
 * 广告渲染失败
 */
- (void)ipd_feedFullVideoAdViewRenderFail:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView error:(NSError *_Nullable)error{
    NSLog(@"%@",error);
}

/**
 * 广告曝光回调
 */
- (void)ipd_feedFullVideoAdViewWillShow:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView{
}

/**
视频广告播放状态更改回调
*/
- (void)ipd_feedFullVideoAdViewStateDidChanged:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView state:(IPDMediaPlayerStatus)playerState{
    
}

/**
视频广告播放完毕
*/
- (void)ipd_feedFullVideoAdViewPlayerDidPlayFinish:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView{

}

/**
 * 广告点击回调
 */
- (void)ipd_feedFullVideoAdViewDidClick:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView{
    
}

/**
* 广告详情页面即将展示回调
*/
- (void)ipd_feedFullVideoAdViewDetailViewWillPresentScreen:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView{
    
}

/**
 *广告详情页关闭回调
 */
- (void)ipd_feedFullVideoAdViewDetailViewClosed:(IPDFeedFullVideoProvider *)provider view:(IPDFeedFullVideoView*) adView{
    
}

#pragma mark =============== UISet ===============
-(void)addBackButton{
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if (@available(iOS 13.0, *)) {
        [closeButton setImage:[UIImage systemImageNamed:@"chevron.backward.circle"] forState:UIControlStateNormal];
        [closeButton setImageEdgeInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
        closeButton.imageView.contentMode = UIViewContentModeScaleToFill;
    } else {
        [closeButton setTitle:@"返回" forState:UIControlStateNormal];
        // Fallback on earlier versions
    }
    [closeButton setBackgroundColor:[UIColor whiteColor]];
    closeButton.frame = CGRectMake(6, 44, 44, 44);
    closeButton.layer.cornerRadius = 22;
    [closeButton addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:closeButton];
}

-(void)popVC{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark =============== createTable ===============
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.pagingEnabled = YES;
        if (@available(iOS 11.0, *)) {
            _table.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _table.estimatedRowHeight = 0;
            _table.estimatedSectionHeaderHeight = 0;
            _table.estimatedSectionFooterHeight = 0;
        }
        _table.backgroundColor = [UIColor whiteColor];
        _table.delegate = self;
        _table.dataSource = self;
    }
    
    return _table;
}

#pragma mark =============== UITableViewDataSource ===============
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id object =  self.dataArray[indexPath.row];
    if ([object isKindOfClass:[IPDFeedFullVideoView class]]) {
        IPDVideoExpressAdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IPDVideoExpressAdCell"];
        if (!cell) {
            cell = [[IPDVideoExpressAdCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IPDVideoExpressAdCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        // 重用BUNativeExpressAdView，先把之前的广告试图取下来，再添加上当前视图
        UIView *subView = (UIView *)[cell.contentView viewWithTag:1000];
        if ([subView superview]) {
            [subView removeFromSuperview];
        }
        UIView *view = object;
        view.tag = 1000;
        [cell.contentView addSubview:view];
        return cell;
    }else{
        static NSString *reuseID = @"IPDVideoExpressCell";
        
        IPDVideoExpressCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (!cell) {
            cell = [[IPDVideoExpressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        }
        return cell;
    }
}

#pragma mark =============== UITableViewDelegate ===============
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_H;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/**
 #pragma mark-======header
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 return <#headHeight#>;
 }
 - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
 UIView * headBagView = [UIView new];
 headBagView.frame = CGRectMake(0, 0, <#FUll_VIEW_WIDTH#>, <#FUll_VIEW_HEIGHT#>);
 headBagView.backgroundColor = [UIColor lightGrayColor];
 UILabel * headlabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, <#FUll_VIEW_WIDTH#>, headBagView.frameHeight)];
 headlabel.text = @"头部";
 [headBagView addSubview:headlabel];
 return <#headBagView#>;
 }
 #pragma mark-======footer
 - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
 return <#headHeight#>;
 }
 - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
 UIView * headBagView = [UIView new];
 headBagView.frame = CGRectMake(0, 0, <#FUll_VIEW_WIDTH#>, <#FUll_VIEW_HEIGHT#>);
 headBagView.backgroundColor = [UIColor lightGrayColor];
 UILabel * headlabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, <#FUll_VIEW_WIDTH#>, headBagView.height)];
 headlabel.text = @"底部";
 [headBagView addSubview:headlabel];
 return headBagView;
 }
 */

#pragma mark =============== LazyLoad ===============
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0 ; i <= 15; i++) {
            NSString *string = [NSString stringWithFormat:@"第%d行的标题",i];
            [array addObject:string];
        }
        _dataArray = array;
    }
    return _dataArray;
}

@end
