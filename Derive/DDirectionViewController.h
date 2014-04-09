//
//  DDirectionViewController.h
//  Derive
//
//  Created by Nick Lanasa on 2/20/14.
//  Copyright (c) 2014 Nytek Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDirectionViewController : UIViewController

@property (nonatomic) NSTimeInterval walkTime;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) NSInteger direction;
- (IBAction)goBack:(id)sender;
- (IBAction)backToTimerClick:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *directionLabel;
@end
