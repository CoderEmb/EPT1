//
//  EPTAddAccountPageViewController.h
//  EPT1
//
//  Created by Rushi Rawal on 12/10/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPTAddAccountPageViewController : UIViewController

@property (nonatomic,retain) IBOutlet UIButton* CancelButton;
@property (nonatomic,retain) IBOutlet UIButton* DoneButton;
-(IBAction)btnPressed :(id)sender;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;


@end
