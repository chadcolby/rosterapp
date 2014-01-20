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


@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *studentImage;
@property (weak, nonatomic) IBOutlet UITextField *twitterHandle;

@property (weak, nonatomic) IBOutlet UITextField *githubHandle;


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
//    self.myScrollView.contentSize = CGSizeMake(1000, 1000);
//    self.myScrollView.delegate = self;
    self.twitterHandle.text = self.person.twitterHandle;
    self.githubHandle.text = self.person.githubHandle;
    self.studentImage.backgroundColor = [UIColor lightGrayColor];


    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    

    
    
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
        //self.studentImage.clipsToBounds = YES;
        self.studentImage.layer.cornerRadius = 70.0f;
        
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
    
    if (githubHandle.length == 0 && twitterHandle.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Crap!" message:@"Please enter your Github and Twitter info." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        
        [alert show];
    } else {
        
        
    }
    NSLog(@"%@ and %@", self.twitterHandle, self.githubHandle );
    [self saveStudenPictureData];
    NSLog(@"Photo: %@", self.studentImage.image);
}

- (NSData *)saveStudenPictureData
{
    //FKAPersons *selectedPerson = [[FKAPersons alloc]init];
    NSData *photoData = UIImagePNGRepresentation(self.studentImage.image);
    return photoData;
}

/*
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}
*/
/*
- (void)keyboardWasShown: (NSNotification *) notification
{
    NSDictionary *info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets  = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    self.myScrollView.contentInset = contentInsets;
    self.myScrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, self.twitterName.frame.origin)) {
        [self.myScrollView scrollRectToVisible:self.twitterName.frame animated:YES];
    }
}
*/
/*
- (void)keyboardWillBeHidden: (NSNotification *) notification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.myScrollView.contentInset = contentInsets;
    self.myScrollView.scrollIndicatorInsets = contentInsets;
}
*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
@end
