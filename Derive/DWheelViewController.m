//
//  DWheelViewController.m
//  Derive
//
//  Created by Nick Lanasa on 2/20/14.
//  Copyright (c) 2014 Nytek Productions. All rights reserved.
//

#import "DWheelViewController.h"
#import "DDirectionViewController.h"

#define LEFT 0
#define RIGHT 1
#define BACK 2
#define FORWARD 3

@interface DWheelViewController ()

@end

@implementation DWheelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Generate";
}

- (void)viewWillAppear:(BOOL)animated
{
    [self runSpinAnimationOnView:self.imageView duration:1.0 rotations:6];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations;
{
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.delegate = self;
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)animationDidStop:(CABasicAnimation *)theAnimation finished:(BOOL)flag {
    
    DDirectionViewController *directionViewController = [[DDirectionViewController alloc] initWithNibName:@"DDirectionViewController" bundle:nil];
//    directionViewController.walkTime = self.picker.countDownDuration;
    
    NSInteger randDirecton = arc4random() % 4;
    switch (randDirecton) {
        case LEFT:
            directionViewController.direction = LEFT;
            break;
        case RIGHT:
            directionViewController.direction = RIGHT;
            break;
        case BACK:
            directionViewController.direction = BACK;
            break;
        case FORWARD:
            directionViewController.direction = FORWARD;
            break;
    }
    
    [self.navigationController pushViewController:directionViewController animated:YES];
    
}

- (void)runActionForKey:(NSString *)event object:(id)anObject
              arguments:(NSDictionary *)dict
{
    
}

@end
