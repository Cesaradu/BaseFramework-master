//
//  BaseCollectionCell.m
//  BaseFramework
//
//  Created by hztuen on 2017/4/25.
//  Copyright © 2017年 Cesar. All rights reserved.
//

#import "BaseCollectionCell.h"

@implementation BaseCollectionCell

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

@end
