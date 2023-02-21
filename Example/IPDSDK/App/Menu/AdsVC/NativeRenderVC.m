//
//  NativeRenderVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "NativeRenderVC.h"
#import "IPDNativeRenderMultipleImageCell.h"
#import "IPDNativeRenderVideoCell.h"
#import "IPDNativeRenderImageCell.h"

@interface NativeRenderVC ()<IPDNativeAdDelegate,UITableViewDataSource,UITableViewDelegate,IPDNativeAdViewDelegate>
@property (strong, nonatomic) UITableView *table;
@property (nonatomic,strong)IPDNativeAd *nativeAd;
@property (nonatomic,strong)NSMutableArray <IPDNativeAdObject *>*dataArray;

@end

@implementation NativeRenderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.dataArray = [NSMutableArray array];
    [self setRightBarBtn];
    [self.view addSubview:self.table];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isFirstLoad) {
        [self loadAd:AdId_NativeRender];
        self.isFirstLoad = NO;
    }
}

-(void)setRightBarBtn{
    UIButton * regreshBtn = [[UIButton alloc]init];
    if (@available(iOS 13.0, *)) {
        [regreshBtn setImage:[UIImage systemImageNamed:@"arrow.clockwise"] forState:UIControlStateNormal];
        [regreshBtn setImage:[UIImage systemImageNamed:@"arrow.clockwise"] forState:UIControlStateSelected];
    } else {
        [regreshBtn setTitle:@"刷新" forState:UIControlStateNormal];
    }
   [regreshBtn setFrame:CGRectMake(0, 0, 40, 44)];
   [regreshBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [regreshBtn addTarget:self action:@selector(loadAd) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:regreshBtn];

}


-(void) loadAd:(NSString*) adId{
    self.nativeAd = [[IPDNativeAd alloc] initWithPlacementId:adId];
    self.nativeAd.delegate = self;
    [self.nativeAd loadAdWithCount:4];
}

#pragma mark =============== createTable ===============
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-TopBar_H ) style:UITableViewStyleGrouped];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _table.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _table.estimatedRowHeight = 0;
            _table.estimatedSectionHeaderHeight = 0;
            _table.estimatedSectionFooterHeight = 0;
        }
        _table.backgroundColor = [UIColor whiteColor];
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerClass:[IPDNativeRenderMultipleImageCell class] forCellReuseIdentifier:@"IPDNativeRenderMultipleImageCell"];
        [_table registerClass:[IPDNativeRenderImageCell class] forCellReuseIdentifier:@"IPDNativeRenderImageCell"];
        [_table registerClass:[IPDNativeRenderVideoCell class] forCellReuseIdentifier:@"IPDNativeRenderVideoCell"];
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
    IPDNativeAdObject *object =  self.dataArray[indexPath.row];
    if (object.materialType == IPDAdMaterialTypeVideo) {
        IPDNativeRenderVideoCell *cell = [self.table dequeueReusableCellWithIdentifier:@"IPDNativeRenderVideoCell" forIndexPath:indexPath];
        [cell setupWithUnifiedNativeAdDataObject:object delegate:self vc:self];
        return cell;
    } else if (object.materialType == IPDAdMaterialTypeAtlas){
        IPDNativeRenderMultipleImageCell *cell = [self.table dequeueReusableCellWithIdentifier:@"IPDNativeRenderMultipleImageCell" forIndexPath:indexPath];
        [cell setupWithUnifiedNativeAdDataObject:object delegate:self vc:self];
        return cell;
    }else {
        IPDNativeRenderImageCell *cell = [self.table dequeueReusableCellWithIdentifier:@"IPDNativeRenderImageCell" forIndexPath:indexPath];
        [cell setupWithUnifiedNativeAdDataObject:object delegate:self vc:self];
        return cell;
    }
}

#pragma mark =============== UITableViewDelegate ===============
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IPDNativeAdObject  *object =  self.dataArray[indexPath.row];
    
    if (object.materialType == IPDAdMaterialTypeVideo) {
        return [IPDNativeRenderVideoCell cellHeightWithUnifiedNativeAdDataObject:object];
    } else if (object.materialType == IPDAdMaterialTypeAtlas){
        return [IPDNativeRenderMultipleImageCell cellHeightWithUnifiedNativeAdDataObject:object];
    }else {
        return [IPDNativeRenderImageCell cellHeightWithUnifiedNativeAdDataObject:object];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"==%ld",(long)indexPath.row);
}


#pragma mark =============== IPDNativeAdViewDelegate ===============
- (void)ipd_nativeAdLoaded:(NSArray<IPDNativeAdObject *> * _Nullable)nativeAdObjects error:(NSError * _Nullable)error{
    if (!error &&nativeAdObjects.count > 0) {
        [self.dataArray addObjectsFromArray:nativeAdObjects];
        [self.table reloadData];
        
    }else{
        NSLog(@"自渲染错误回调:%@",error);
    }
}

//广告曝光回调
-(void)ipd_nativeAdViewWillExpose:(UIView *)nativeAdView{
    NSLog(@"%s",__FUNCTION__);
}
//广告点击回调
-(void)ipd_nativeAdViewDidClick:(UIView *)nativeAdView{
    NSLog(@"%s",__FUNCTION__);
}
//广告详情页关闭回调
-(void)ipd_nativeAdDetailViewClosed:(UIView *)nativeAdView{
    NSLog(@"%s",__FUNCTION__);
}
//广告详情页面即将展示回调
-(void)ipd_nativeAdDetailViewWillPresentScreen:(UIView *)nativeAdView{
    NSLog(@"%s",__FUNCTION__);
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
