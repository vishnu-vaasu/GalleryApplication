//
//  InformationiTunesViewController.h
//  GalleryApplication
//
//  Created by Thirumala on 7/20/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GalleryViewController.h"

@interface InformationiTunesViewController : UIViewController<UIAlertViewDelegate>

@property(strong,nonatomic)NSString * urlString;


+ (InformationiTunesViewController *)sharedInstance;
@end
