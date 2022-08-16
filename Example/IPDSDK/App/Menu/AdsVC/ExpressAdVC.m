//
//  ExpressAdVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "ExpressAdVC.h"
#import "IPDExpressCell.h"
@interface ExpressAdVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@end

@implementation ExpressAdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.table];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    @"G3061112693227741",@"K4000000007",@"T945740162",@"zjad_iOS_ZF0001",@"K4000000008"
    if (self.isFirstLoad) {
        [self loadAd:@"G3061112693227741"];
        self.isFirstLoad = NO;
    }
}

-(void) loadAd:(NSString*) adId{

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
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseID = @"IPDExpressCell";
    
    IPDExpressCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if(!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"IPDExpressCell" owner:nil options:nil].firstObject;
    }
    cell.titleLabel.text = [NSString stringWithFormat:@"第%ld行的标题",indexPath.row];
    return cell; 
}

#pragma mark =============== UITableViewDelegate ===============
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
