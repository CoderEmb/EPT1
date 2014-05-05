//
//  EPTAddTransactionViewController.h
//  EPT1
//
//  Created by Rushi Rawal on 12/10/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPTAddTransactionViewController : UIViewController <UITextFieldDelegate>


@property (nonatomic,retain) IBOutlet UIButton* CancelButton;
@property (nonatomic,retain) IBOutlet UIBarButtonItem* DoneButton;
-(IBAction)btnPressed :(id)sender;

@property (nonatomic,retain) IBOutlet UIScrollView *scroller;
@property NSArray* fetchedObjects;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (void)registerForKeyboardNotifications;
- (void)keyboardWasShown:(NSNotification*)aNotification;
- (void)keyboardWillBeHidden:(NSNotification*)aNotification;


@end
