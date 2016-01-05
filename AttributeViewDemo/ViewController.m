//
//  ViewController.m
//  AttributeViewDemo
//
//  Created by 唐建平 on 16/1/5.
//  Copyright © 2016年 JP. All rights reserved.
//

#import "ViewController.h"
#import "AttributeView.h"
#import "UIView+Extnesion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSArray *texts = @[@"京东",@"淘宝",@"搜狐",@"腾讯",@"阿里",@"百度",@"360",@"猫扑",@"酷狗",@"网易",@"天猫",@"美丽说",@"蘑菇街",@"饿了么",@"美团",@"大众点评",@"QQ",@"微信",@"塔读",@"iOS",@"安卓",@"苹果",@"iPhone",@"宝马",@"奔驰",@"劳斯莱斯",@"迈巴赫",@"迪拜"];
    UIView *attributeView = [AttributeView attributeViewWithTitle:@"类型" titleFont:[UIFont boldSystemFontOfSize:20] attributeTexts:texts viewWidth:250];
    // 这里不用设置attriButeView的frame, 只需要设置y值就可以了,而且Y值是必须设置的,高度是已经在内部计算好的.可以更改宽度.
    attributeView.y = 100;
    [self.view addSubview:attributeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
