//
//  AppDelegate.h
//  GalleryApplication
//
//  Created by Thirumala on 7/19/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GalleryViewController.h"
#import "ModelViewController.h"
#import  "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)ModelViewController * modelParser;
@property(strong,nonatomic) NSMutableArray * storeArray;

@end
