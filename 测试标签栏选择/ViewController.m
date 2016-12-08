//
//  ViewController.m
//  测试标签栏选择
//
//  Created by cyh on 16/7/6.
//  Copyright © 2016年 cyh. All rights reserved.
//

#import "ViewController.h"
#import "DLScrollTabbarView.h"
#import "DLLRUCache.h"
#import "NSString+Size.h"
#import "DLCustomSlideView.h"
#import "SMExpertListViewController.h"

#define KSM_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define KSM_Screen_Width       [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()<DLCustomSlideViewDelegate>
/**
 *标题数目
 */
@property (nonatomic, strong) NSMutableArray *titles;
/**
 *item的数组
 */
@property (nonatomic, strong) NSMutableArray *itemArr;
@property (nonatomic, strong) DLCustomSlideView *slideView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"test";
    
    [self creatScrollTabbar];

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)creatScrollTabbar{
    DLLRUCache *cache = [[DLLRUCache alloc]initWithCount:10];
    self.slideView = [[DLCustomSlideView alloc]initWithFrame:CGRectMake(0, 64, KSM_Screen_Width, KSM_Screen_Height - 64)];
    
    [self.view addSubview:self.slideView];
    DLScrollTabbarView *tabbar = [[DLScrollTabbarView alloc]initWithFrame:CGRectMake(0, 0, KSM_Screen_Width, 34.0)];
    tabbar.backgroundColor = [[UIColor cyanColor]colorWithAlphaComponent:0.2];
    tabbar.tabItemNormalColor = [UIColor blackColor];
    tabbar.tabItemSelectedColor = [UIColor redColor];
    tabbar.tabItemNormalFontSize = 13.0f;
    self.titles = [NSMutableArray arrayWithObjects:@"你好",@"是东方酒店",@"热建代理商可",@"你好垃圾房广东",@"是东方店",@"热",@"你好就会感觉会根据",@"是店",@"f福建代理商可", nil];
    self.itemArr = [NSMutableArray array];
    for (int i = 0; i < self.titles.count; i++) {
        CGFloat stringWidth = [self.titles[i] widthWithFont:[UIFont systemFontOfSize:13.0] constrainedToHeight:20];
        DLScrollTabbarItem *item = [DLScrollTabbarItem itemWithTitle:self.titles[i] width:stringWidth + 25];
        [self.itemArr addObject:item];
    }
    tabbar.tabbarItems = self.itemArr;
    self.slideView.tabbar = tabbar;
    self.slideView.cache = cache;
    self.slideView.tabbarBottomSpacing = 5;
    self.slideView.baseViewController = self;
    self.slideView.delegate = self;
    [self.slideView setup];
    self.slideView.selectedIndex = 0;
    
}

-(NSInteger)numberOfTabsInDLCustomSlideView:(DLCustomSlideView *)sender{
    return self.itemArr.count;
}

-(UIViewController *)DLCustomSlideView:(DLCustomSlideView *)sender controllerAt:(NSInteger)index{
    SMExpertListViewController *contact = [[SMExpertListViewController alloc]init];
    return contact;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
