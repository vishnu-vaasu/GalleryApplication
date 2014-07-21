//
//  GalleryViewController.m
//  GalleryApplication
//
//  Created by Thirumala on 7/19/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//

#import "GalleryViewController.h"
#import "UIImageView+AFNetworking.h"
#import "AFURLSessionManager.h"
#import "GalleryViewCell.h"
#import "InformationiTunesViewController.h"
#import "AutoScrollLabel.h"

@interface GalleryViewController ()

{
    AutoScrollLabel * autoScroll;
}
@end

@implementation GalleryViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

+ (GalleryViewController *)sharedInstance
{
    static GalleryViewController *sharedInstance;
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
    
    self.title=@"Gallery";
        self.navigationController.toolbar.translucent = NO;
     // [self xmlParsing];

  //  [[NSNotificationCenter defaultCenter] postNotificationName:@"loadData" object:nil];
    
    
     
    self.galleryTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,self.segmentsForListAndGrid.frame.origin.y+30,self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
   self.galleryCollectioView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,self.segmentsForListAndGrid.frame.origin.y+30, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    
   
    [flowLayout setItemSize:CGSizeMake(200, 200)];
//    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.minimumInteritemSpacing = 0.0f;
    [self.galleryCollectioView setCollectionViewLayout:flowLayout];
    self.galleryCollectioView.bounces = YES;
    [self.galleryCollectioView setShowsHorizontalScrollIndicator:NO];
    [self.galleryCollectioView setShowsVerticalScrollIndicator:NO];
    
    
    [self.galleryCollectioView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.galleryCollectioView setBackgroundColor:[UIColor clearColor]];
    
    
    UINib  *nib=[UINib nibWithNibName:@"GalleryViewCell" bundle:nil];
    [self.galleryTableView registerNib:nib forCellReuseIdentifier:@"Cell"];

    
    self.galleryTableView.dataSource=self;
    self.galleryTableView.delegate=self;
    self.galleryCollectioView.dataSource=self;
    self.galleryCollectioView.delegate=self;
    
    [self.view addSubview:self.galleryTableView];
    
    [self.view addSubview:self.galleryCollectioView];
    
   
        
        [self.galleryCollectioView setHidden:YES];

    
  
       self.modelParser=[[ModelViewController alloc]init];
    
    self.utilsArray=SharedAppDelegate.storeArray;
    
  
   
    
    
    // Do any additional setup after loading the view from its nib.
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentActionForListAndGridViews:(UISegmentedControl *)sender {
    
    if (self.segmentsForListAndGrid.selectedSegmentIndex==0) {
        
        [self.galleryCollectioView setHidden:YES];
        [self.galleryTableView setHidden:NO];
        [self.galleryTableView reloadData];
    }
    else{
        [self.galleryCollectioView setHidden:NO];
        [self.galleryTableView setHidden:YES];
        [self.galleryCollectioView reloadData];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
      
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%@,%@",self.utilsArray,SharedAppDelegate.storeArray);
    
    return self.utilsArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    static NSString *cellIdentifier = @"Cell";
    // NSString *cellIdentifier = [NSString stringWithFormat:@"Cell %d",indexPath.row];
    GalleryViewCell *   cell = (GalleryViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // If there is no cell to reuse, create a new one
    if(cell == nil)
    {
        cell = [[GalleryViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        
        
    }
    
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    
    Utilities * utils=self.utilsArray[indexPath.row];
    
    
    cell.title.text=utils.name;
    
   autoScroll=[[AutoScrollLabel alloc]initWithFrame:CGRectMake(5,150, 300, 18)];
    
    autoScroll.backgroundColor=[UIColor whiteColor];
    
    
    autoScroll.text = utils.url;
    autoScroll.textColor = [UIColor brownColor];
    
    [cell addSubview:autoScroll];
    
   // cell.urlLink.text=utils.url;
    
    
    
   // NSURL *url = [NSURL URLWithString:utils.image];
    
    NSLog(@"IMAge urlSTrInG iS%@",utils.image);
    

    
   NSString * str= [utils.image stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    NSURL *aUrl = [NSURL URLWithString:str];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:aUrl];
    UIImage *placeholderImage = [UIImage imageNamed:@"Default.jpg"];
    
    __weak GalleryViewCell *weakCell = cell;
    
    [weakCell.photo setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       
                                       NSLog(@"jkwdkjwjbdbjdbjb");
                                       
                                       weakCell.photo.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    
    
   

    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    Utilities * utils=self.utilsArray[indexPath.row];
    
    urlString=utils.url;
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Continue will take you to iTunes store" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    alertView.delegate=self;
    [alertView show];
    
//    
//    [InformationiTunesViewController sharedInstance].urlString=utils.url;
//    [self.navigationController pushViewController:[InformationiTunesViewController sharedInstance] animated:YES];
    
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 175;
}


#pragma mark - collection view data source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.utilsArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    for (UILabel *lbl in cell.contentView.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            [lbl removeFromSuperview];
        }
    }
    
    

    
   cell.backgroundColor=[UIColor greenColor];
    
    Utilities * utils=self.utilsArray[indexPath.row];
    
    UILabel * title=[[UILabel alloc]initWithFrame:CGRectMake(10, 175, 200, 35)];
    
    title.font=[UIFont fontWithName:nil size:15.0];
    title.text=utils.name;
    
    [cell.contentView addSubview:title];
    
    
    
    NSString * str= [utils.image stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    NSURL *aUrl = [NSURL URLWithString:str];
    
    
    UIImageView * photoView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 150, 100)];
    
    
    
 [photoView setImageWithURL:aUrl placeholderImage:[UIImage imageNamed:@"Default.jpg"]];
    
    cell.backgroundView=photoView;
    
    return cell;
}

#pragma mark - collecation view delegate



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Utilities * utils=self.utilsArray[indexPath.row];
    
    urlString=utils.url;
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Continue will take you to iTunes store" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    alertView.delegate=self;
    [alertView show];
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(180, 200);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    if (buttonIndex==1)
        
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        
    }

    
}


@end
