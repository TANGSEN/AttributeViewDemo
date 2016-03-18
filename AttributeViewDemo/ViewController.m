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

/** 当前设备屏幕的宽度 */
#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController () <AttributeViewDelegate>
@property (nonatomic ,weak) UILabel *label0;
@property (nonatomic ,weak) UILabel *label1;
@property (nonatomic ,weak) UILabel *label2;
/** 电商 */
@property (nonatomic ,weak) AttributeView *attributeViewDS;
/** 巨头 */
@property (nonatomic ,weak) AttributeView *attributeViewJT;
/** 国家 */
@property (nonatomic ,weak) AttributeView *attributeViewGJ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubViews];
    
}


- (void)createSubViews{
    // 创建最底层的scrollview
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, kScreenW, 1)];
    scrollView.backgroundColor = [UIColor colorWithRed:92/255.0 green:192/255.0 blue:83/255.0 alpha:1.0];
    
    // 创建电商属性视图
    NSArray *dsData = @[@"淘宝",@"京东",@"天猫",@"亚马逊",@"大众点评网算电商吗",@"有货"];
    AttributeView *attributeViewDS = [AttributeView attributeViewWithTitle:@"电商" titleFont:[UIFont boldSystemFontOfSize:20] attributeTexts:dsData viewWidth:kScreenW];
    self.attributeViewDS = attributeViewDS;
    
    // 创建巨头属性视图
    NSArray *jtData = @[@"腾讯",@"阿里巴巴",@"百度",@"谷歌(google)",@"这是一句用来测试的文本"];
    AttributeView *attributeViewJT = [AttributeView attributeViewWithTitle:@"巨头" titleFont:[UIFont boldSystemFontOfSize:20] attributeTexts:jtData viewWidth:kScreenW];
    self.attributeViewJT = attributeViewJT;
    
    // 创建国家属性视图
    NSArray *gjData = @[@"中国",@"美国",@"德国",@"韩国",@"英国",@"俄罗斯",@"越南",@"老挝",@"朝鲜",@"日本小岛"];
    AttributeView *attributeViewGJ = [AttributeView attributeViewWithTitle:@"国家" titleFont:[UIFont boldSystemFontOfSize:20] attributeTexts:gjData viewWidth:kScreenW];
    self.attributeViewGJ = attributeViewGJ;
    
    // 这里不用设置attriButeView的frame, 只需要设置y值就可以了,而且Y值是必须设置的,高度是已经在内部计算好的.可以更改宽度.
    attributeViewDS.y = 0;
    attributeViewJT.y = CGRectGetMaxY(attributeViewDS.frame) + 15;
    attributeViewGJ.y = CGRectGetMaxY(attributeViewJT.frame) + 15;
    
    // 显示电商信息
    UILabel *label0 = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(attributeViewGJ.frame)  + 50, (kScreenW - 80) / 3, 50)];
    label0.text = @"默认文字";
    self.label0 = label0;
    
    // 显示巨头信息
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(20 + label0.width, label0.y, label0.width, 50)];
    label1.text = @"默认文字";
    self.label1 = label1;
    
    // 显示国家信息
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20 + label1.width * 2, label0.y,label0.width, 50)];
    label2.text = @"默认文字";
    self.label2 = label2;
    
    // 设置代理
    attributeViewDS.Attribute_delegate = self;
    attributeViewJT.Attribute_delegate = self;
    attributeViewGJ.Attribute_delegate = self;
    
    // 添加到scrollview上
    [scrollView addSubview:attributeViewDS];
    [scrollView addSubview:attributeViewJT];
    [scrollView addSubview:attributeViewGJ];
    [scrollView addSubview:label0];
    [scrollView addSubview:label1];
    [scrollView addSubview:label2];
    scrollView.contentSize = (CGSize){0,[UIScreen mainScreen].bounds.size.height + 20};
    
    // 添加scrollview到当前view上
    [self.view addSubview:scrollView];
    // 通过动画设置scrollview的高度, 也可以一开始就设置好
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        scrollView.height += [UIScreen mainScreen].bounds.size.height - 30;
    } completion:nil];
}


#pragma mark - AttributeViewDelegate
- (void)Attribute_View:(AttributeView *)view didClickBtn:(UIButton *)btn{
    // 判断, 根据点击不同的attributeView上的标签, 执行不同的代码
    
    
    NSString *title = btn.titleLabel.text;
    if (!btn.selected) {
        title = @"默认文字";
    }
        if ([view isEqual:self.attributeViewDS]) {
            
            self.label0.text = title;
        }else if ([view isEqual:self.attributeViewJT]){
            
            self.label1.text = title;
        }else{
            self.label2.text = title;
        }
    
}

@end
