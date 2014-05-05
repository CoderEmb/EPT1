//
//  EPTEditAccountPageViewController.m
//  EPT1
//
//  Created by Rushi Rawal on 12/19/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import "EPTEditAccountPageViewController.h"
#import "EPTAppDelegate.h"
#import "Accounts.h"

@interface EPTEditAccountPageViewController ()
@property (weak, nonatomic) IBOutlet UITextField *AccountName;
@property (weak, nonatomic) IBOutlet UITextField *OpeningBalance;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;


@end

@implementation EPTEditAccountPageViewController

@synthesize CancelButton;
@synthesize DoneButton;
@synthesize managedObjectContext;
@synthesize AccountName;
@synthesize OpeningBalance;
@synthesize selectedAccount;

- (void)initialSetup
{
    self.AccountName.text = self.selectedAccount.sAccountName;
    self.OpeningBalance.text = [self.selectedAccount.iCurBalance stringValue];
    
}


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
    
    EPTAppDelegate* appDelegate  = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedOBCon;
    
    [self initialSetup];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnPressed :(id)sender
{
    NSLog(@"inside btnPressed");
    
    if(sender == CancelButton)
    {
        NSLog(@"Cancel Button Pressed on Edit Account Page");
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    else if(sender == DoneButton)
    {
        NSLog(@"Done Button Pressed on Edit Account Page");
        
        self.selectedAccount.sAccountName = self.AccountName.text;
        
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber * myNumber = [f numberFromString:self.OpeningBalance.text];
        self.selectedAccount.iCurBalance = myNumber;
        
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
        
        NSLog(@"%@", AccountName);
        NSLog(@"%d", OpeningBalance);
        
        //[toAddtoAccounts AddToAccountsArray:AccountName :OpeningBalance];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    else
    {
        NSLog(@"Some Other Button");
    }
    
    
}



@end
