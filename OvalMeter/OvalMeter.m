//
//  OvalMeter.m
//  OvalMeter
//
//  Created by qq on 2016/12/19.
//  Copyright © 2016年 qq. All rights reserved.
//

#import "OvalMeter.h"

@interface OvalMeter(){
    NSTimer *timer;
    CGFloat animatingValue;
}
@property (strong, nonatomic) IBOutlet UIView *view;

@end
@implementation OvalMeter
// MARK: - initialize
-(void)xibSetup{
    self.view = [self loadViewFromNib];
    
    // use bounds not frame or it'll be offset
    self.view.frame = self.bounds;
    
    // Make the view stretch with containing view
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    self.lbUnit.textColor = self.percentOval.textColor;
    
    self.lbTitle.textColor = self.percentOval.textColor;
  
    
    self.lbNumber.textColor = self.percentOval.textColor;

    
    
    [_percentOval setup];
    [self addSubview:self.view];
}

-(UIView*)loadViewFromNib{
    
    NSBundle *bundle = [NSBundle bundleForClass:[OvalMeter class]];
    
    UINib* nib = [UINib nibWithNibName:@"OvalMeter" bundle:bundle];
    
    UIView *view = [nib instantiateWithOwner:self options:nil][0];
    
    return view;
}
-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame: frame];
    [self xibSetup];
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    self = [super initWithCoder:aDecoder];
    [self xibSetup];
    return self;
}

// MARK: - Setter/Getter
-(void)setForeOvalColor:(UIColor*)color{
    _percentOval.foreOvalColor = color;
}
-(UIColor*)foreOvalColor{
    return _percentOval.foreOvalColor;
}
-(void)setBgOvalColor:(UIColor*)color{
    _percentOval.bgOvalColor = color;
}
-(UIColor*)bgOvalColor{
    return _percentOval.bgOvalColor;
}
-(void)setValue:(CGFloat)value{
    _value = value;
    _percentOval.value = value;
    _lbNumber.text = [NSString stringWithFormat:@"%.0f",_percentOval.value*100];
}
-(void)setStartDegree:(CGFloat)degree{
    _percentOval.startDegree = degree;
}
-(CGFloat)startDegree{
    return _percentOval.startDegree;
}
-(void)setOvalLineWidth:(CGFloat)ovalLineWidth{
    _percentOval.ovalLineWidth = ovalLineWidth;
}
-(CGFloat)ovalLineWidth{
    return _percentOval.ovalLineWidth;
}

-(void)setCloseArc:(BOOL)closeArc{
    _percentOval.closeArc = closeArc;
}
-(BOOL)closeArc{
    return _percentOval.closeArc;
}
// MARK: - Timer Handler
-(void)startAnimating{
    if(_animating){
        [self stopAnimating];
    }
    _animating = YES;
//    animatingValue = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(timerHandler:) userInfo:nil repeats:YES];
}
-(void)stopAnimating{
    if(timer!=nil){
        [timer invalidate];
    }
//    self.value = _value;
    _animating = NO;
}
-(void)timerHandler:(NSTimer*)t{
    animatingValue += self.value/30;
    if(animatingValue >= self.value){
        [self stopAnimating];
        self.value = _value;
        animatingValue = 0;
    }else{
        _percentOval.value = animatingValue;
        _lbNumber.text = [NSString stringWithFormat:@"%.0f",_percentOval.value*100];
    }
}
@end
