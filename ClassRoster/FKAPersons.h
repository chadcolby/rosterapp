//
//  FKAPersons.h
//  ClassRoster
//
//  Created by Chad D Colby on 1/15/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKAPersons : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *profilePic;
@property (nonatomic, strong) NSMutableArray *students;

- (NSMutableArray *)loadStudentsList;

@end
