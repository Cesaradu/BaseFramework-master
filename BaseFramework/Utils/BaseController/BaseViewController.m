//
//  BaseViewController.m
//  BaseFramework
//
//  Created by hztuen on 17/3/2.
//  Copyright © 2017年 Cesar. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 适配 给定4.7寸屏尺寸，适配4和5.5寸屏尺寸
 */
- (float)Suit:(float)MySuit
{
    (IS_IPHONE4INCH||IS_IPHONE35INCH)?(MySuit=MySuit/Suit4Inch):((IS_IPHONE55INCH)?(MySuit=MySuit*Suit55Inch):MySuit);
    return MySuit;
}

/**
 适配 给定4.7寸屏字号，适配4(-1)和5.5(+1)寸屏字号
 */
- (float)SuitFont:(float)font
{
    (IS_IPHONE4INCH||IS_IPHONE35INCH)?(font=font-1):((IS_IPHONE55INCH)?(font=font+1):font);
    return font;
}

//轮播图
-(SDCycleScrollView *)makeShufflingView:(UIView *)set_View theImageArray:(NSArray *)imageArray AndFrame:(CGRect)frames AndPlaceholderImage:(UIImage *)placeholderImage
{
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frames delegate:self placeholderImage:placeholderImage];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView.pageDotColor = [UIColor colorWithHexString:@"ffffff" alpha:0.39];
    cycleScrollView.currentPageDotColor = [UIColor colorWithHexString:@"ffffff" alpha:0.85];
    cycleScrollView.pageControlDotSize = CGSizeMake(7, 7);
    [set_View addSubview:cycleScrollView];
    //cycleScrollView.imageURLStringsGroup = imageArray;
    cycleScrollView.localizationImageNamesGroup = imageArray;
    
    return cycleScrollView;
}

- (void)buildNaviBarLelfBtn
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"left-icon"] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, 27, 27);
    
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [leftBtn addTarget:self action:@selector(gotoNaviBarLelfBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    if(([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0?15:0))
    {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = 0;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftBtnItem];
    } else {
        self.navigationItem.leftBarButtonItem = leftBtnItem;
    }
    
}

// 返回按钮的方法
- (void)gotoNaviBarLelfBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
}

//创建label，位置自己写
-(UILabel *)labelWithColor:(NSString *)color AndFont:(CGFloat)font AndAlignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor colorWithHexString:color alpha:1.0];
    label.font = [UIFont systemFontOfSize:[self Suit:font]];
    label.textAlignment = alignment;
    return label;
}

//创建button, 位置自己写
-(UIButton *)buttonWithTitle:(NSString *)title AndTitleColor:(NSString *)titleColor AndTitleFont:(CGFloat)titleFont AndBackgroundColor:(NSString *)bgColor addTarget:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = [UIFont systemFontOfSize:[self Suit:titleFont]];
    if (title)
    {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:titleColor alpha:1.0] forState:UIControlStateNormal];
    }
    if (bgColor)
    {
        [button setBackgroundColor:[UIColor colorWithHexString:bgColor alpha:1.0]];
    }
    if (target && action)
    {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
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
