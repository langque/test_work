//
//  ViewController.h
//  BullsEye
//
//  Created by CY-LQ on 2015-05-27.
//  Copyright (c) 2015 L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
    <UIAlertViewDelegate>



@property (nonatomic, weak) IBOutlet UISlider *slider;

@property (nonatomic, weak) IBOutlet UILabel *targetLabel;

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;

@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert;

- (IBAction)slider:(UISlider *)slider;

- (IBAction)startOver;

@end

