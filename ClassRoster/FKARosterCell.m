//
//  FKARosterCell.m
//  ClassRoster
//
//  Created by Chad D Colby on 1/17/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKARosterCell.h"

@implementation FKARosterCell

@synthesize nameLabel, smallPicture;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.smallPicture.layer.masksToBounds = YES;
//        self.smallPicture.layer.cornerRadius = 20.0f;
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
