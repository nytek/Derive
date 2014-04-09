//
//  DDirectionViewController.m
//  Derive
//
//  Created by Nick Lanasa on 2/20/14.
//  Copyright (c) 2014 Nytek Productions. All rights reserved.
//

#import "DDirectionViewController.h"
#import "DWalkViewController.h"
#import <QuartzCore/QuartzCore.h>

#define LEFT 0
#define RIGHT 1
#define BACK 2
#define FORWARD 3

@interface DDirectionViewController () <UIAlertViewDelegate>

@end

@implementation DDirectionViewController

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
    
    self.title = @"Direction";
    
    [self.navigationController.navigationBar setHidden:YES];
    
    switch (_direction) {
        case LEFT:
        {
            self.imageView.image = [UIImage imageNamed:@"LEFT"];
            self.directionLabel.text = @"WALK LEFT";
        }
            break;
        case RIGHT:
        {
            self.imageView.image = [UIImage imageNamed:@"RIGHT"];
            self.directionLabel.text = @"WALK RIGHT";
        }
            break;
        case BACK:
        {
            self.imageView.image = [UIImage imageNamed:@"TURN_AROUND"];
            self.directionLabel.text = @"WALK BACK";
        }
            break;
        case FORWARD:
        {
            self.imageView.image = [UIImage imageNamed:@"WALK_FORWARD"];
            self.directionLabel.text = @"WALK FORWARD";
        }
            break;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)backToTimerClick:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Confirm" message:@"Are you sure you want to go back to the walk timer?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        DWalkViewController *walkVC = [[DWalkViewController alloc] initWithNibName:@"DWalkViewController" bundle:nil];
        [self.navigationController pushViewController:walkVC animated:YES];
    }
}

@end
