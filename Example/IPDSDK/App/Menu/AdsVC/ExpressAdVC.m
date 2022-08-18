//
//  ExpressAdVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "ExpressAdVC.h"
#import "IPDExpressCell.h"
#import "IPDExpressAdCell.h"
@interface ExpressAdVC ()<UITableViewDelegate,UITableViewDataSource,IPDNativeExpressFeedAdDelegate,IPDNativeExpressFeedAdManagerDelegate>

@property (nonatomic,strong)IPDNativeExpressFeedAdManager *expressAdManager;

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ExpressAdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setRightBarBtn];
    [self.view addSubview:self.table];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    @"G3061112693227741",@"K4000000007",@"T945740162",@"zjad_iOS_ZF0001",@"K4000000008"
    if (self.isFirstLoad) {
        [self loadAd];
        self.isFirstLoad = NO;
    }
}

-(void) loadAd{
    if (!_expressAdManager) {
        _expressAdManager = [[IPDNativeExpressFeedAdManager alloc] initWithPlacementId:@"G3061112693227741" size:CGSizeMake(self.table.frame.size.width, 0)];
        _expressAdManager.delegate = self;
        _expressAdManager.mutedIfCan = YES;
    }
    [_expressAdManager loadAdDataWithCount:3];
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

#pragma mark =============== createTable ===============
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-TopBar_H) style:UITableViewStyleGrouped];
        _table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        if (@available(iOS 11.0, *)) {
            _table.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _table.estimatedRowHeight = 0;
            _table.estimatedSectionHeaderHeight = 0;
            _table.estimatedSectionFooterHeight = 0;
        }
        _table.backgroundColor = [UIColor clearColor];
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerNib:[UINib nibWithNibName:@"IPDExpressCell" bundle:nil] forCellReuseIdentifier:@"IPDExpressCell"];
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
    if ([object isKindOfClass:[IPDNativeExpressFeedAd class]]) {
        IPDExpressAdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IPDExpressAdCell"];
        if (!cell) {
            cell = [[IPDExpressAdCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IPDExpressAdCell"];
        }
        [cell refreshWithAd:object];
        return cell;
    }else{
        static NSString *reuseID = @"IPDExpressCell";
        
        IPDExpressCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if(!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"IPDExpressCell" owner:nil options:nil].firstObject;
        }
        cell.titleLabel.text = self.dataArray[indexPath.row];
        return cell;
    }

}

#pragma mark =============== UITableViewDelegate ===============
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id object =  self.dataArray[indexPath.row];
    if ([object isKindOfClass:[IPDNativeExpressFeedAd class]]) {
        return ((IPDNativeExpressFeedAd *)object).feedView.frame.size.height;
    }else{
        return 98;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark =============== IPDNativeExpressFeedAdManagerDelegate ===============
-(void)ipd_nativeExpressFeedAdManagerSuccessToLoad:(IPDNativeExpressFeedAdManager *)adsManager nativeAds:(NSArray<IPDNativeExpressFeedAd *> *)feedAdDataArray{
    //不要保存太多广告，需要在合适的时机手动释放不用的，否则内存会过大
    for (int i = 0; i<feedAdDataArray.count; i++) {
        IPDNativeExpressFeedAd *feedAd = feedAdDataArray[i];
        feedAd.rootViewController = self;
        feedAd.delegate = self;
        [feedAd render];
        
        NSInteger index = i*3;
        if (index >= self.dataArray.count) {
            [self.dataArray addObject:feedAd];
        }else{
            [self.dataArray insertObject:feedAd atIndex:index];
        }
    }
    [self.table reloadData];
}

-(void)ipd_nativeExpressFeedAdManager:(IPDNativeExpressFeedAdManager *)adsManager didFailWithError:(NSError *)error{
    NSLog(@"error:%@",error);
}


#pragma mark =============== IPDNativeExpressFeedAdDelegate ===============
/**
 * 广告渲染成功
 */
- (void)ipd_nativeExpressFeedAdRenderSuccess:(IPDNativeExpressFeedAd *)feedAd{
    [self.table reloadData];
}

/**
 * 广告渲染失败
 */
- (void)ipd_nativeExpressFeedAdRenderFail:(IPDNativeExpressFeedAd *)feedAd{
    [self.dataArray removeObject:feedAd];
    [self.table reloadData];
}

- (void)ipd_nativeExpressFeedAdViewWillShow:(IPDNativeExpressFeedAd *)feedAd{

}

- (void)ipd_nativeExpressFeedAdDidClick:(IPDNativeExpressFeedAd *)feedAd{
    
}

- (void)ipd_nativeExpressFeedAdDislike:(IPDNativeExpressFeedAd *)feedAd{
    [self.dataArray removeObject:feedAd];
    [self.table reloadData];
}

- (void)ipd_nativeExpressFeedAdDidShowOtherController:(IPDNativeExpressFeedAd *)nativeAd{
    
}

- (void)ipd_nativeExpressFeedAdDidCloseOtherController:(IPDNativeExpressFeedAd *)nativeAd{
    
}


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
