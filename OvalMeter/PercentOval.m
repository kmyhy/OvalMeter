//
//  OvalMeter.m
//  OvalMeter
//
//  Created by qq on 2016/12/19.
//  Copyright © 2016年 qq. All rights reserved.
//

#import "PercentOval.h"


@implementation PercentOval

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setup];
    }
    return self;
}
-(instancetype)init{
    CGRect rect = CGRectMake(0, 0, 204, 204);
    self = [self initWithFrame:rect];
    return self;
}

-(void)setup{
    self.backgroundColor = [UIColor clearColor];
    self.foreOvalColor = [UIColor colorWithRed: 0.102 green: 0.824 blue: 0.753 alpha: 1];
    self.textColor = [UIColor colorWithRed: 0.6 green: 0.6 blue: 0.6 alpha: 1];
    self.bgOvalColor = [UIColor colorWithRed: 0.922 green: 0.918 blue: 0.918 alpha: 1];
    
    _value = 0.7;
    _ovalLineWidth = 2;
    _startDegree = 160;
    _fillColor = [UIColor clearColor];
    _closeArc = NO;
}
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat ovalWidth = CGRectGetWidth(rect)-_ovalLineWidth;
    CGFloat ovalHeight = CGRectGetHeight(rect)-_ovalLineWidth;
    CGRect ovalRect = CGRectMake(_ovalLineWidth/2, _ovalLineWidth/2, ovalWidth, ovalHeight);
    
    UIBezierPath* bgOvalPath = [UIBezierPath bezierPathWithOvalInRect: ovalRect];
    [_bgOvalColor setStroke];
    bgOvalPath.lineWidth = _ovalLineWidth;
    [bgOvalPath stroke];
    
    CGContextSaveGState(context);

    // 逆时针偏移 _value* 360 度（注意，逆时针是减，顺时针是加）
    CGFloat endDegree = _startDegree - _value*360;
    CGRect greenOvalRect = ovalRect;
    UIBezierPath* greenOvalPath = [UIBezierPath bezierPath];
    [greenOvalPath addArcWithCenter: CGPointMake(CGRectGetMidX(greenOvalRect), CGRectGetMidY(greenOvalRect)) radius: CGRectGetWidth(greenOvalRect) / 2 startAngle: _startDegree * M_PI/180 endAngle: endDegree * M_PI/180 clockwise: NO];
    
    // 如果需要封闭路径
    if(_closeArc == true){
        [greenOvalPath addLineToPoint: CGPointMake(CGRectGetMidX(greenOvalRect), CGRectGetMidY(greenOvalRect))];
        [greenOvalPath closePath];
    }
    
    [_foreOvalColor setStroke];
    [_fillColor setFill];
    greenOvalPath.lineWidth = _ovalLineWidth;
    [greenOvalPath stroke];
    [greenOvalPath fill];
    
    
    CGContextRestoreGState(context);

}
// MARK: - Setters
-(void)setForeOvalColor:(UIColor*)color{
    _foreOvalColor = color;
    [self setNeedsDisplay];
}
-(void)setBgOvalColor:(UIColor*)color{
    _bgOvalColor = color;
    [self setNeedsDisplay];
}
-(void)setValue:(CGFloat)value{
    if(value < 0){
        _value = 0;
    }else if(value > 1){
        _value = 1;
    }else{
        _value = value;
    }
    [self setNeedsDisplay];
}

-(void)setStartDegree:(CGFloat)degree{
    _startDegree = degree;
    [self setNeedsDisplay];
}
-(void)setOvalLineWidth:(CGFloat)ovalLineWidth{
    _ovalLineWidth = ovalLineWidth;
    [self setNeedsDisplay];
}

-(void)setCloseArc:(BOOL)closeArc{
    _closeArc = closeArc;
    [self setNeedsDisplay];
}
@end
