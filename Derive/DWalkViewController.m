//
//  DWalkViewController.m
//  Derive
//
//  Created by Nick Lanasa on 2/20/14.
//  Copyright (c) 2014 Nytek Productions. All rights reserved.
//

#import "DWalkViewController.h"
#import "DWheelViewController.h"
#import "DAppDelegate.h"

@interface DWalkViewController ()

@property (nonatomic, retain)DAppDelegate *appDelegate;

@end

@implementation DWalkViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Walk time";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonClick:(id)sender {
    _appDelegate = (DAppDelegate *)[[UIApplication sharedApplication] delegate];
    _appDelegate.walkTime = _picker.countDownDuration;
    [_appDelegate startWalkTimer];
    
    DWheelViewController *directionViewController = [[DWheelViewController alloc] initWithNibName:@"DWheelViewController" bundle:nil];
    [self.navigationController pushViewController:directionViewController animated:YES];
}

@end
