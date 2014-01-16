//
//  FKAPersons.m
//  ClassRoster
//
//  Created by Chad D Colby on 1/15/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKAPersons.h"

@implementation FKAPersons

-(NSMutableArray *)loadStudentsList
{
    self.students = [[NSMutableArray alloc] init];
    
    NSString *pListFilePath = [[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"];
    NSMutableArray *arrayOfStudents = [NSMutableArray arrayWithContentsOfFile:pListFilePath];
    for (NSDictionary *tempDict in arrayOfStudents) {
        NSString *name = [tempDict objectForKey:@"name"];
        [self.students addObject:name];
    }
    
    
    return self.students;
}

@end
