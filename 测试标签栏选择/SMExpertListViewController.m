//
//  SMExpertListViewController.m
//  测试标签栏选择
//
//  Created by cyh on 16/7/6.
//  Copyright © 2016年 cyh. All rights reserved.
//

#import "SMExpertListViewController.h"

@interface SMExpertListViewController ()

@end

@implementation SMExpertListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int32_t rgbValue = rand();
    self.view.backgroundColor = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
