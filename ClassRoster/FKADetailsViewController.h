//
//  FKADetailsViewController.h
//  ClassRoster
//
//  Created by Chad D Colby on 1/15/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKAPersons.h"

@interface FKADetailsViewController : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIScrollViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) FKAPersons *person;

- (NSData *)saveStudenPictureData;



@end
    