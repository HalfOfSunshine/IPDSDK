//
//  IPDMainViewController.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/15.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDMainViewController.h"
#import "IPDMainCell.h"
#import <IPDSDK/IPDSDK.h>
@interface IPDMainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSDictionary *adTypesDic;
@property (nonatomic, strong) NSArray *adTypesArray;
@end

@implementation IPDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Do any additional setup after loading the view.
    [self setNavBar];

    self.title = @"IPDAdSDK Demo";

    [self.view addSubview:self.table];
}

#pragma mark =============== UISet ===============
-(void)setNavBar{
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorFromHexRGB:@"B22222"]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;

    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *appperance = [[UINavigationBarAppearance alloc]init];
        appperance.backgroundColor = MainColor;
        appperance.shadowImage = [[UIImage alloc]init];
        appperance.shadowColor = nil;
        [appperance setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
        self.navigationController.navigationBar.standardAppearance = appperance;
        self.navigationController.navigationBar.scrollEdgeAppearance = appperance;
    }
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
        [_table registerNib:[UINib nibWithNibName:@"IPDMainCell" bundle:nil] forCellReuseIdentifier:@"IPDMainCell"];

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
    return self.adTypesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseID = @"IPDMainCell";
    IPDMainCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if(!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"IPDMainCell" owner:nil options:nil].firstObject;
        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;//设置点击没有选中效果
    }
    cell.DescLab.text = self.adTypesArray[indexPath.row];
    return cell;
}

#pragma mark =============== UITableViewDelegate ===============
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"==%ld",(long)indexPath.row);
    NSString *keyType = self.adTypesArray[indexPath.row];
    
    if ([self.adTypesDic.allKeys containsObject:keyType]) {
        NSString *vcName = self.adTypesDic[keyType];
        UIViewController *vc  = [[NSClassFromString(vcName) alloc] init];
        vc.title = keyType;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        NSAssert(NO, @"未找到该广告对应的VC，请检查字段");
    }
}

#pragma mark-======footer
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footBagView = [UIView new];
    footBagView.frame = CGRectMake(0, 0, SCREEN_W, 50);
    footBagView.backgroundColor = [UIColor clearColor];
    UILabel * footlabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 50)];
    footlabel.text = [NSString stringWithFormat:@"v%@",[IPDAdSDK SDKVersion]];
    footlabel.textAlignment = NSTextAlignmentCenter;
    footlabel.textColor = [UIColor colorFromHexRGB:@"0x909399"];
    [footBagView addSubview:footlabel];
    return footBagView;
}


 #pragma mark-======header
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
     return 0.1;
 }
 - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     UIView * headBagView = [UIView new];
     headBagView.frame = CGRectMake(0, 0, SCREEN_W, 0.1);
     headBagView.backgroundColor = [UIColor lightGrayColor];
     UILabel * headlabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREEN_W, 0.1)];
     headlabel.text = @"头部";
     [headBagView addSubview:headlabel];
     return headBagView;
 }
 
#pragma mark =============== LazyLoad ===============
- (NSDictionary*)adTypesDic{
    if(!_adTypesDic){
        _adTypesDic = @{@"激励视频":@"RewardVC",
                        @"开屏广告":@"SplashVC",
                        @"插屏广告":@"InterstitialVC",
                        @"Banner广告":@"BannerVC",
                        
                        @"全屏视频":@"FullScreenVideoVC",
                        @"视频内容":@"ContentPageVC",
                        @"信息流":@"ExpressAdVC",
                        @"视频流":@"VideoExpressAdVC",
                        
                        @"自渲染":@"NativeRenderVC",
                        @"新闻资讯":@"NewsVC",
                        @"H5页面":@"H5VC",
                        @"悬浮广告":@"FloatingAdVC",
                        @"JS交互":@"JSBridgeVC"};
    }
    return _adTypesDic;;
}

- (NSArray*)adTypesArray{
    if(!_adTypesArray){
        _adTypesArray = @[@"激励视频",
                          @"开屏广告",
                          @"插屏广告",
                          @"Banner广告",
                          
                          @"全屏视频",
                          @"视频内容",
                          @"信息流",
                          @"视频流",
                          
                          @"自渲染",
                          @"新闻资讯",
                          @"悬浮广告",
                          @"H5页面",
                          @"JS交互"];
    }
    return _adTypesArray;;
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
