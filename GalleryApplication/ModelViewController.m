//
//  ModelViewController.m
//  GalleryApplication
//
//  Created by Thirumala on 7/19/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//

#import "ModelViewController.h"
#import "GalleryViewController.h"


@interface ModelViewController ()
{
    NSString * image;
    NSString * urlLink;
}

@end

@implementation ModelViewController

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
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    SharedAppDelegate.storeArray = [[NSMutableArray alloc]init];
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    
    if (qName)
	{
		elementName = qName;
    }
    
    
    if ([elementName isEqualToString:@"entry"])
	{
		self.utils = [[Utilities alloc] init];
        NSLog(@"utils allocated");
        return;
    }
    else if  ([elementName isEqualToString:@"title"]||[elementName isEqualToString:@"im:image"])
    {
        self.elementName=[NSMutableString string];
    }
    else
    {
        self.elementName = nil;
    }

    
    if ([elementName isEqualToString:@"im:image"]) {
        
        NSLog(@"%2@",elementName);
        image = [attributeDict objectForKey:@"height"];
        // Do you stuff with the href
    }
    else if ([elementName isEqualToString:@"link"])
    {
        urlLink=[attributeDict objectForKey:@"href"];
    }
    

   
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.elementName)
        [self.elementName appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (qName)
	{
		elementName = qName;
    }
    
    if ([elementName isEqualToString:@"im:image"])
    {
 
        if ([image intValue]==100) {
            self.utils.image=self.elementName;
            
        }
        else
        {
            
        }
        
            

    }
    else if ([elementName isEqualToString:@"link"])
    {
        self.utils.url=urlLink;
    }
    
    
    else if ([elementName isEqualToString:@"title"])
    {
        self.utils.name=self.elementName;
    }
    
    else if ([elementName isEqualToString:@"entry"])
    {
        [SharedAppDelegate.storeArray addObject:self.utils];
        
        NSLog(@"%@,%@",self.utils.name,self.utils.image);
        
        NSLog(@"%@%d",SharedAppDelegate.storeArray,SharedAppDelegate.storeArray.count);
        
    }

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
