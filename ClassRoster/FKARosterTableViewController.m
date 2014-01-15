//
//  FKARosterTableViewController.m
//  ClassRoster
//
//  Created by Chad D Colby on 1/14/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKARosterTableViewController.h"
#import "FKADetailsViewController.h"

@interface FKARosterTableViewController ()

@property (nonatomic, strong) NSMutableArray *students;

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
    
    
    
    self.students = [[NSMutableArray alloc]init];
    
    // Load students from plist
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"Bootcamp" ofType:@"plist"];
    NSMutableArray *dataArray = [NSMutableArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *dict in dataArray) {
        NSString *namez = [dict objectForKey:@"name"];
        //NSLog(@"%@", namez);
        [self.students addObject:namez]; //add each name to the "students" array
        }
    
    // Set pull to refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor lightGrayColor];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.students objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/




#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"pushToDetails"]) {
        //FKADetailsViewController *detailsView = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; //trying to get student name to set as details view title
        NSLog(@"%ld", (long)indexPath.row);
        
    }
}

 

@end
