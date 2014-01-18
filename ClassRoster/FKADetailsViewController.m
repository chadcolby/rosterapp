//
//  FKADetailsViewController.m
//  ClassRoster
//
//  Created by Chad D Colby on 1/15/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKADetailsViewController.h"
#import "FKARosterTableViewController.h"
#import "FKAPersons.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface FKADetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *studentImage;

@end

@implementation FKADetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.person.name;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    

}

- (IBAction)cameraButtonPushed:(id)sender {
    UIActionSheet *mySheeet = [[UIActionSheet alloc] initWithTitle:@"Get a photo from..." delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photo Library", nil];
    
    [mySheeet showFromBarButtonItem:sender animated:YES];
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"Camera"]) {
        UIImagePickerController *myImagePicker = [[UIImagePickerController alloc]init];
        myImagePicker.delegate = self;
        
        myImagePicker.allowsEditing = YES;
        myImagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:myImagePicker animated:YES completion:nil];
    }
    
    if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"Photo Library"]) {
        UIImagePickerController *myImagePicker = [[UIImagePickerController alloc]init];
        myImagePicker.delegate = self;
        
        myImagePicker.allowsEditing = YES;
        myImagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:myImagePicker animated:YES completion:nil];
    }
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        self.studentImage.image = [info objectForKey:UIImagePickerControllerEditedImage];
        self.studentImage.layer.masksToBounds = YES;
        self.studentImage.clipsToBounds = YES;
        self.studentImage.layer.cornerRadius = 90.0f;
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        NSString *documentPath = [paths objectAtIndex:0];
        NSString *personName = [NSString stringWithFormat:@"%@.png", self.person.name];
        NSString *filePath = [documentPath stringByAppendingString:personName];
        
        NSData *PNGData = UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage]);
        [PNGData writeToFile:filePath atomically:YES];
        
    }];
}

- (IBAction)doneButtonPushed:(id)sender
{
    NSString *githubHandle = [self.githubHandle.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *twitterHandle = [self.twitterHandle.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([githubHandle length] == 0 || [twitterHandle length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Crap!" message:@"Please enter your Github and Twitter info." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        
        [alert show];
    } else {
        
    }
    //NSLog(@"%@ and %@", twitterHandle, githubHandle );
//    [self saveStudentData];
}

- (NSData *)saveStudentData
{
    //FKAPersons *selectedPerson = [[FKAPersons alloc]init];
    NSData *photoData = UIImagePNGRepresentation(self.studentImage.image);
    return photoData;
}


@end
