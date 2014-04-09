//
//  DPictureViewController.m
//  Derive
//
//  Created by Nick Lanasa on 2/20/14.
//  Copyright (c) 2014 Nytek Productions. All rights reserved.
//

#import "DPictureViewController.h"
#import "DWalkViewController.h"

@interface DPictureViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation DPictureViewController

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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(goNext)];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goNext)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    self.view.gestureRecognizers = [NSArray arrayWithObject:swipe];
    
}

- (void)goNext
{
    if (_pictureImage != [UIImage imageNamed:@"2instructions2.jpg"]) {
        DPictureViewController *pictureViewController = [[DPictureViewController alloc] initWithNibName:@"DPictureViewController" bundle:nil];
        pictureViewController.pictureImage = [UIImage imageNamed:@"2instructions2.jpg"];
        pictureViewController.navTitle = @"Exit";
        [self.navigationController pushViewController:pictureViewController animated:YES];
    } else {
        DWalkViewController *walkViewController = [[DWalkViewController alloc] initWithNibName:@"DWalkViewController" bundle:nil];
        [self.navigationController pushViewController:walkViewController animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = _navTitle;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setPictureImage:(UIImage *)pictureImage
{
    if (_pictureImage != pictureImage) {
        _pictureImage = pictureImage;
        self.imageView.image = pictureImage;
        [self.view addSubview:self.imageView];
    }
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    
    return _imageView;
}

@end
