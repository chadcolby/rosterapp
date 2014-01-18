//
//  FKAModelController.m
//  ClassRoster
//
//  Created by Chad D Colby on 1/17/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKAModelController.h"
#import "FKAPersons.h"

@implementation FKAModelController

- (id)init
{
    self = [super init];
    if (self) {
        
        NSURL *dataFile = [[self applicationsDocumentsDirectory]URLByAppendingPathComponent:@"savedRoster"];
        self.masterRoster = [NSKeyedUnarchiver unarchiveObjectWithFile:[dataFile path]];
        
        if (!self.masterRoster) {
        
        NSString *pListFilePath = [[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"];
        NSMutableArray *arrayOfStudents = [NSMutableArray arrayWithContentsOfFile:pListFilePath];
        self.masterRoster = [NSMutableArray new];
        
        for (NSDictionary *tempDict in arrayOfStudents) {
            FKAPersons *student = [[FKAPersons alloc]init];
            student.name = [tempDict objectForKey:@"name"];
            [self.masterRoster addObject:student];
            
            }
            [self saveData];
        }
    
    } 
        return self;
}

// Gets the URL for the app's documents directory
- (NSURL *)applicationsDocumentsDirectory
{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentationDirectory inDomains:NSUserDomainMask]lastObject];
}

- (void) saveData
{
    NSURL *dataFile = [[self applicationsDocumentsDirectory]URLByAppendingPathComponent:@"savedRoster"];
    [NSKeyedArchiver archiveRootObject:self.masterRoster toFile:[dataFile path]];
}

@end
