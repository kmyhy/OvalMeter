//
//  OvalMeter.h
//  OvalMeter
//
//  Created by qq on 2016/12/19.
//  Copyright © 2016年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface PercentOval : UIView

@property(strong,nonatomic)IBInspectable UIColor* foreOvalColor;
@property(strong,nonatomic)UIColor* textColor;
@property(strong,nonatomic)IBInspectable UIColor* bgOvalColor;

@property(assign,nonatomic)IBInspectable CGFloat value;// between 0-1

@property(assign,nonatomic)IBInspectable CGFloat startDegree;
@property(assign,nonatomic)IBInspectable CGFloat ovalLineWidth;

@property(assign,nonatomic)IBInspectable BOOL closeArc;// 封闭弧
@property(strong,nonatomic)IBInspectable UIColor* fillColor;// 弧的填充色

-(void)setup;
@end
