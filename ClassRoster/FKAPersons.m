//
//  FKAPersons.m
//  ClassRoster
//
//  Created by Chad D Colby on 1/15/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKAPersons.h"

@implementation FKAPersons

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.profilePicture = [aDecoder decodeObjectForKey:@"image"];
    self.githubHandle = [aDecoder decodeObjectForKey:@"github"];
    self.twitterHandle = [aDecoder decodeObjectForKey:@"twitter"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.profilePicture forKey:@"image"];
    [aCoder encodeObject:self.githubHandle forKey:@"github"];
    [aCoder encodeObject:self.twitterHandle forKey:@"twitter"];
    
    
}


@end
