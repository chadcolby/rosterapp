//
//  FKARosterTableViewController.h
//  ClassRoster
//
//  Created by Chad D Colby on 1/14/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKARosterTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *students;

@end
