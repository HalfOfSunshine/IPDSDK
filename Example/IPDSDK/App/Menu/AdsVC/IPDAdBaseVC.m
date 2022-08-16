//
//  IPDAdBaseVC.m
//  IPDSDK_Example
//
//  Created by 麻明康 on 2022/8/16.
//  Copyright © 2022 Mountain King. All rights reserved.
//

#import "IPDAdBaseVC.h"

@interface IPDAdBaseVC ()

@end

@implementation IPDAdBaseVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isFirstLoad = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)dealloc{
    NSLog(@"class %@ is deallocated",NSStringFromClass([self class]));
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
