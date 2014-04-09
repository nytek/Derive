//
//  DWalkViewController.h
//  Derive
//
//  Created by Nick Lanasa on 2/20/14.
//  Copyright (c) 2014 Nytek Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWalkViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *picker;
- (IBAction)startButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end
