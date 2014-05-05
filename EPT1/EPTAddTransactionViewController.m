//
//  EPTAddTransactionViewController.m
//  EPT1
//
//  Created by Rushi Rawal on 12/10/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import "EPTAddTransactionViewController.h"
#import "EPTAddTagPageViewController.h"
#import "EPTAppDelegate.h"
#import "Transactions.h"
#import "Accounts.h"
#import "CategoryTags.h"

@interface EPTAddTransactionViewController ()
@property (weak, nonatomic) IBOutlet UITextField *dTranDate;
@property (weak, nonatomic) IBOutlet UITextField *iTranAmt;
@property (weak, nonatomic) IBOutlet UITextField *sTranAccName;
@property (weak, nonatomic) IBOutlet UITextField *sTagName;
@property UITextField* activeField;

@property (weak, nonatomic) IBOutlet UIButton *AddTagButton;


@end

@implementation EPTAddTransactionViewController

@synthesize CancelButton;
@synthesize DoneButton;
@synthesize dTranDate;
@synthesize iTranAmt;
@synthesize sTranAccName;
@synthesize sTagName;
@synthesize managedObjectContext;
@synthesize fetchedObjects;
@synthesize scroller;
@synthesize activeField;
@synthesize AddTagButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320,920)];
    [self registerForKeyboardNotifications];
    
    EPTAppDelegate *myEPTAppDelegate =
    (EPTAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    managedObjectContext = myEPTAppDelegate.managedOBCon;
    
    dTranDate.delegate = self;
    iTranAmt.delegate = self;
    sTranAccName.delegate = self;
    sTagName.delegate = self;

	// Do any additional setup after loading the view.
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerForKeyboardNotifications
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
}


// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect bkgndRect = activeField.superview.frame;
    bkgndRect.size.height += kbSize.height;
    [activeField.superview setFrame:bkgndRect];
    [scroller setContentOffset:CGPointMake(0.0, activeField.frame.origin.y+kbSize.height) animated:YES];

}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scroller.contentInset = contentInsets;
    scroller.scrollIndicatorInsets = contentInsets;
}

-(IBAction)btnPressed :(id)sender
{
    NSLog(@"inside btnPressed for add transaction page");
    
    if(sender == CancelButton)
    {
        NSLog(@"Cancel Button Pressed on add transaction page");
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    else if(sender == DoneButton)
    {
        NSLog(@"Done Button Pressed on add transaction page");
        
        //NSDate *dTransactionDate = (NSDate*)self.dTranDate.text;
        
        NSString* sAccountName = self.sTranAccName.text;
        
        int iTransactionAmount = [self.iTranAmt.text intValue];
        
        NSString* sTransactionTag = self.sTagName.text;
        
        NSManagedObjectContext *context = [self managedObjectContext];
        
        Transactions * newTransaction = [NSEntityDescription insertNewObjectForEntityForName:@"Transactions"
                                   inManagedObjectContext:context];
        //  2
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        // this is imporant - we set our input date format to match our input string
        // if format doesn't match you'll get nil from your string, so be careful
        [dateFormatter setDateFormat:@"MM-dd-yyyy"];
        NSDate *dateFromString = [[NSDate alloc] init];
        // voila!
        dateFromString = [dateFormatter dateFromString:self.dTranDate.text];
        
        newTransaction.dDate = dateFromString;
        
        NSNumber* nbr = [[NSNumber alloc] initWithInt:iTransactionAmount];
        newTransaction.iAmount = nbr;
        
        
        NSError *error;
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Accounts"
                                                  inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        
        [fetchRequest setResultType:NSManagedObjectResultType];
        
        NSPredicate* predicate = [NSPredicate predicateWithFormat:@"sAccountName = %@", sAccountName];
        
        [fetchRequest setPredicate:predicate];
        
        NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
        
        if([fetchedObjects count] >0)
        {
        
           Accounts *retrievedAcc = [fetchedObjects objectAtIndex:0];
        
           newTransaction.iTrantoAcc = retrievedAcc;
            
            NSLog(@"%@", retrievedAcc.sAccountName);
            NSLog(@"%d", [retrievedAcc.iCurBalance intValue]);
            
        }
        
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            
        }
        
        //newTransaction.iTrantoAcc = [NSSet setWithObjects:<#(id), ...#>, nil]
        
        NSFetchRequest *fetchRequestForTag = [[NSFetchRequest alloc] init];
        NSEntityDescription *entityForTag = [NSEntityDescription entityForName:@"CategoryTags"
                                                  inManagedObjectContext:context];
        [fetchRequestForTag setEntity:entityForTag];
        
        [fetchRequestForTag setResultType:NSManagedObjectResultType];
        
        NSPredicate* predicateForTag = [NSPredicate predicateWithFormat:@"sTagName = %@", sTransactionTag];
        
        [fetchRequestForTag setPredicate:predicateForTag];
        
        NSArray *fetchedObjectsForTag = [context executeFetchRequest:fetchRequestForTag error:&error];
        
        if([fetchedObjectsForTag count] > 0)
        {
        
          CategoryTags *retrievedTag = [fetchedObjectsForTag objectAtIndex:0];
        
            NSSet *test = [[NSSet alloc] init];
            
            test = [NSSet setWithObject:retrievedTag];
            
            newTransaction.sTranToTag = test;
        
           NSLog(@"%@", retrievedTag.sTagName);
        
           if (![self.managedObjectContext save:&error]) {
               NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            }
        }
        
        
        NSLog(@"%@", dateFromString);
        NSLog(@"%d", iTransactionAmount);
        NSLog(@"%@", sAccountName);
        NSLog(@"%d", iTransactionAmount);
        
        //[toAddtoAccounts AddToAccountsArray:AccountName :OpeningBalance];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    else if (sender == AddTagButton)
    {
        NSLog(@"Add Tag Button Pressed on Add Transaction Page");
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        EPTAddTagPageViewController *AddTagPage = [storyBoard instantiateViewControllerWithIdentifier:@"AddTag"];
        
        
        [self.navigationController pushViewController:AddTagPage animated:YES];

    }
    else
    {
        
        NSLog(@"Some Other Button");
        
    }
    
    
    
}


@end
