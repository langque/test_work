//
//  ViewController.m
//  BullsEye
//
//  Created by CY-LQ on 2015-05-27.
//  Copyright (c) 2015 L. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewRound];
    [self startNewGame];
    [self updateLabels];
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
}

- (void)startNewRound {
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert {
    int difference = abs(_targetValue - _currentValue);
    int point = 100 - difference;
    
    
    NSString *title;
    
    if (difference == 0) {
        title = @"Perfect!";
        point += 100;
    } else if (difference < 5) {
        title = @"You almost had it";
        if (difference == 1) {
            point += 5;
        }
    } else if (difference < 10){
        title = @"Pertty Good";
    } else {
        title = @"Not even close";
    }
    
    _score += point;

    NSString *message = [NSString stringWithFormat:@"You scored %d points",point];
    
    UIAlertView *alertView = [[UIAlertView alloc]
        initWithTitle:title
        message:message
        delegate:self
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)slider:(UISlider *)slider {
    //NSLog(@"The value of the slider now : %f", slider.value);
    _currentValue = lroundf(slider.value);
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self startNewRound]; [self updateLabels];
}


- (IBAction)startOver {
    [self startNewGame];
    [self updateLabels];
}

- (void)startNewGame {
    _score = 0;
    _round = 0;
    [self startNewRound];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end















