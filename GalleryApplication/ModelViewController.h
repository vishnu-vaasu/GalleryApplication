//
//  ModelViewController.h
//  GalleryApplication
//
//  Created by Thirumala on 7/19/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utilities.h"

@interface ModelViewController : UIViewController<NSXMLParserDelegate>




@property(nonatomic,strong)NSMutableString * elementName;

@property (nonatomic,strong)Utilities * utils;




@end
