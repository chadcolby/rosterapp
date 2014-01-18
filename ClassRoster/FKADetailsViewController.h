//
//  FKADetailsViewController.h
//  ClassRoster
//
//  Created by Chad D Colby on 1/15/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKAPersons.h"

@interface FKADetailsViewController : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (IBAction)cameraButtonPushed:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *githubHandle;
@property (weak, nonatomic) IBOutlet UITextField *twitterHandle;
@property (weak, nonatomic) FKAPersons *person;

- (IBAction)doneButtonPushed:(id)sender;

- (NSData *)saveStudentData;



@end
    