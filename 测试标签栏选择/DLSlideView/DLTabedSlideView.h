//
//  DLTabedSlideView.h
//  DLSlideController
//
//  Created by Dongle Su on 14-12-8.
//  Copyright (c) 2014年 dongle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLRUCache.h"
#import "DLSlideTabbarProtocol.h"


@class DLTabedSlideView;

#pragma mark - DLSlideTabbarDelegate
@protocol DLTabedSlideViewDelegate <NSObject>

@required
- (NSInteger)numberOfTabsInDLTabedSlideView:(DLTabedSlideView *)sender;
- (UIViewController *)DLTabedSlideView:(DLTabedSlideView *)sender controllerAt:(NSInteger)index;

@optional
- (void)DLTabedSlideView:(DLTabedSlideView *)sender didSelectedAt:(NSInteger)index;

@end


#pragma mark - DLTabedSlideView
@interface DLTabedSlideView : UIView<DLSlideTabbarDelegate>

@property(nonatomic, weak) UIViewController *baseViewController;

/**
 *  选中索引
 */
@property(nonatomic, assign) NSInteger selectedIndex;
/**
 *  选中的 Controller
 */
@property(nonatomic, strong) UIViewController *selectViewController;

//set tabbar properties.
@property (nonatomic, strong) UIColor *tabItemNormalColor;
@property (nonatomic, strong) UIColor *tabItemSelectedColor;
@property(nonatomic, strong) UIImage *tabbarBackgroundImage;
@property(nonatomic, strong) UIColor *tabbarTrackColor;
/**
 *   add <DLTabedbarItem>
 */
@property(nonatomic, strong) NSArray *tabbarItems;
@property(nonatomic, assign) float tabbarHeight;
@property(nonatomic, assign) float tabbarBottomSpacing;

/**
 *  缓存对象
 */
@property(nonatomic, strong) DLLRUCache * ctrlCache;
/**
 *  缓存数量
 */
@property(nonatomic, assign) NSInteger cacheCount;
/**
 *  代理  有两个必须实现的方法
 */
@property(nonatomic, weak) id<DLTabedSlideViewDelegate>delegate;

/**
 *  加载 tabbar
 */
- (void)buildTabbar;

@end

#pragma mark - DLTabedbarItem
/**
 *  tabbar item 对象
 */
@interface DLTabedbarItem : NSObject
@property (nonatomic, strong) NSString *title;
@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) UIImage *selectedImage;

+ (DLTabedbarItem *)itemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
@end
