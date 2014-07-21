//
//  MainViewController.h
//  GalleryApplication
//
//  Created by Thirumala on 7/20/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *launchButton;


- (IBAction)goToGallery:(UIButton *)sender;
@end
