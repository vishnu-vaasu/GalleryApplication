//
//  MainViewController.m
//  GalleryApplication
//
//  Created by Thirumala on 7/20/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//

#import "MainViewController.h"
#import "GalleryViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)goToGallery:(UIButton *)sender {
    
   
    [self.navigationController pushViewController: [GalleryViewController sharedInstance] animated:YES];
    
}
@end
