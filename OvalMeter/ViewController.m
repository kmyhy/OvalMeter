//
//  ViewController.m
//  OvalMeter
//
//  Created by qq on 2016/12/19.
//  Copyright © 2016年 qq. All rights reserved.
//

#import "ViewController.h"
#import "OvalMeter.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet OvalMeter *ovalMeter;
@property (weak, nonatomic) IBOutlet UIButton *btnAnimating;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// MARK: - Actions
- (IBAction)animating:(id)sender {
    if(_ovalMeter.animating == NO){
        [_ovalMeter startAnimating];
    }else{
        [_ovalMeter stopAnimating];
    }
    
}


@end
