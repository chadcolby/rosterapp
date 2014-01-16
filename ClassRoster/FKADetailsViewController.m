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

@interface FKADetailsViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *studentImage;

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
        self.studentImage.layer.cornerRadius = 140.0f;
        
//        FKAPersons *person = [[FKAPersons alloc] init];
//        UIImage *littleImage = [[UIImage alloc] initWithCGImage:self.studentImage.image.CGImage];
        
    }];
    
}
@end
