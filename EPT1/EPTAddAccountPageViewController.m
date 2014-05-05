//
//  EPTAddAccountPageViewController.m
//  EPT1
//
//  Created by Rushi Rawal on 12/10/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import "EPTAddAccountPageViewController.h"
#import "EPTHomePageViewController.h"
#import "EPTAccountsListTableViewController.h"
#import "EPTAccount.h"
#import "Accounts.h"
#import "EPTAppDelegate.h"


@interface EPTAddAccountPageViewController ()
@property (weak, nonatomic) IBOutlet UITextField *AccountName;
@property (weak, nonatomic) IBOutlet UITextField *OpeningBalance;

@end



@implementation EPTAddAccountPageViewController

@synthesize DoneButton;
@synthesize CancelButton;
@synthesize managedObjectContext;


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
	// Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image1.jpg"]];
    
    EPTAppDelegate *myEPTAppDelegate =
    (EPTAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    managedObjectContext = myEPTAppDelegate.managedOBCon;
    
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
        NSLog(@"Cancel Button Pressed");
    
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    else if(sender == DoneButton)
    {
        NSLog(@"Done Button Pressed");
        
        NSString* AccountName = self.AccountName.text;
    
        int OpeningBalance = [self.OpeningBalance.text intValue];
        
        //EPTAccountsListTableViewController *toAddtoAccounts;
        
        //toAddtoAccounts = [[EPTAccountsListTableViewController alloc] init];
        
        Accounts * newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Accounts"
                                                          inManagedObjectContext:self.managedObjectContext];
        //  2
        newEntry.sAccountName = AccountName;
        NSNumber *nbr = [[NSNumber alloc] initWithInt:OpeningBalance];
        newEntry.iCurBalance = nbr;
        
        //  3
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
