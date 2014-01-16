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

@interface FKARosterTableViewController ()


@end

@implementation FKARosterTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.students = [[[FKAPersons alloc] init] loadStudentsList];
    NSLog(@"%@", self.students[0]);
    
    // Set pull to refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor lightGrayColor];
    self.refreshControl = refreshControl;
    
    self.myCell = [[UITableViewCell alloc]init];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.students objectAtIndex:indexPath.row];
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"codeFellowsLogo" ofType:@"png"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile: filePath];
    
    cell.imageView.image = image;
    cell.imageView.layer.masksToBounds = NO;
    cell.imageView.clipsToBounds = YES;
    cell.imageView.layer.cornerRadius = 21.0f;
    
    
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

 

@end
