//
//  GalleryViewController.h
//  GalleryApplication
//
//  Created by Thirumala on 7/19/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelViewController.h"
#import "InformationiTunesViewController.h"



@interface GalleryViewController : UIViewController<NSXMLParserDelegate,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIAlertViewDelegate>

{
    NSString * urlString;
}



@property(nonatomic,strong)ModelViewController * modelParser;

@property(nonatomic,strong)UITableView * galleryTableView;

@property(nonatomic,strong)UICollectionView * galleryCollectioView;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentsForListAndGrid;

- (IBAction)segmentActionForListAndGridViews:(UISegmentedControl *)sender;

@property(nonatomic,strong)NSMutableArray * imageArray;

@property(nonatomic,strong)NSArray * utilsArray;

+ (GalleryViewController *)sharedInstance;

@end
