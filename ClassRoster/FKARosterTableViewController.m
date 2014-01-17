//
//  FKARosterTableViewController.m
//  ClassRoster
//
//  Created by Chad D Colby on 1/14/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKARosterTableViewController.h"
#import "FKADetailsViewController.h"
#import "FKAPersons.h"
#import "FKARosterCell.h"

@interface FKARosterTableViewController ()


@end

@implementation FKARosterTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.students = [[[FKAPersons alloc] init] loadStudentsList];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    // Set pull to refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor blueColor];
    self.refreshControl = refreshControl;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.students.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    FKARosterCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.nameLabel.text = [self.students objectAtIndex:indexPath.row];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"codeFellowsLogo" ofType:@"png"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile: filePath];
    
    cell.smallPicture.image = image;
    cell.smallPicture.layer.masksToBounds = NO;
    cell.smallPicture.layer.cornerRadius = 21.0f;
    cell.smallPicture.clipsToBounds = YES;
 
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"pushToDetails"]) {
        FKADetailsViewController *detailsView = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailsView.title = [self.students objectAtIndex:indexPath.row];
    }
}

- (IBAction)unwindToRoster:(UIStoryboardSegue *)segue
{
    
}

@end
