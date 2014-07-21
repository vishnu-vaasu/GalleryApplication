//
//  InformationiTunesViewController.m
//  GalleryApplication
//
//  Created by Thirumala on 7/20/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//

#import "InformationiTunesViewController.h"
#import "GalleryViewController.h"

@interface InformationiTunesViewController ()

@end

@implementation InformationiTunesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

+ (InformationiTunesViewController *)sharedInstance
{
    static InformationiTunesViewController *sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        //allochiamo la sharedInstance
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Continue will take you to iTunes store" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    alertView.delegate=self;
    [alertView show];

    
    

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    if (buttonIndex==1)
        
    {
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.urlString]];
        
    }
    else
    {
        [self.navigationController pushViewController:[GalleryViewController sharedInstance] animated:YES];
        
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
