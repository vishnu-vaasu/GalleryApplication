//
//  GalleryViewCell.m
//  GalleryApplication
//
//  Created by Thirumala on 7/20/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//

#import "GalleryViewCell.h"

@implementation GalleryViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
