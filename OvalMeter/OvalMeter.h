//
//  OvalMeter.h
//  OvalMeter
//
//  Created by qq on 2016/12/19.
//  Copyright © 2016年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PercentOval.h"

IB_DESIGNABLE
@interface OvalMeter : UIView
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbNumber;
@property (weak, nonatomic) IBOutlet UILabel *lbUnit;

@property (weak, nonatomic) IBOutlet PercentOval *percentOval;

@property(strong,nonatomic)IBInspectable UIColor* foreOvalColor;
@property(strong,nonatomic)UIColor* textColor;
@property(strong,nonatomic)IBInspectable UIColor* bgOvalColor;

@property(assign,nonatomic)IBInspectable CGFloat value;// between 0-1

@property(assign,nonatomic)IBInspectable CGFloat startDegree;
@property(assign,nonatomic)IBInspectable CGFloat ovalLineWidth;

@property(assign,nonatomic)IBInspectable BOOL closeArc;// 封闭弧

@property(assign,nonatomic)BOOL animating;

-(void)startAnimating;
-(void)stopAnimating;
@end
