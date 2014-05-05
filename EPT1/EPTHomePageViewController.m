//
//  EPTHomePageViewController.m
//  EPT1
//
//  Created by Rushi Rawal on 12/10/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import "EPTHomePageViewController.h"
#import "EPTAddAccountPageViewController.h"
#import "EPTAddTransactionViewController.h"
#import "EPTAccountsListTableViewController.h"
#import "EPTTransactionsListTableViewController.h"
#import "EPTReminderPageViewController.h"
#import "EPTAccount.h"

@interface EPTHomePageViewController ()




@end


@implementation EPTHomePageViewController

@synthesize Accounts;
@synthesize Settings;
@synthesize AddTransaction;
@synthesize Reports;



//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIGraphicsBeginImageContext(self.)
//    

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image1.jpg"]];

    
    //    UIColor *backgroundColor = [[UIColor alloc] initWithPatternImage:@"window-dentist-background.jpg"];
//    
//    self.view.backgroundColor = backgroundColor;
//    
    
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
    
    if(sender == Accounts)
    {
        NSLog(@"Accounts Pressed");
    
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil]; 
        
        EPTAccountsListTableViewController *AccountsListPage = [storyBoard instantiateViewControllerWithIdentifier:@"AccountsListView"];
        

        [self.navigationController pushViewController:AccountsListPage animated:YES];
        
    }
    else if(sender == AddTransaction)
    {
        NSLog(@"Add Transaction Pressed");
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        EPTAddTransactionViewController *AddTransactionPage = [storyboard instantiateViewControllerWithIdentifier:@"AddTransaction"];
        
        [self.navigationController pushViewController:AddTransactionPage animated:YES];
        
    }
    else if(sender == Reports)
    {
        NSLog(@"Reports Button Pressed");
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        EPTTransactionsListTableViewController *TransactionsListPage = [storyboard instantiateViewControllerWithIdentifier:@"TransactionsList"];
        
        [self.navigationController pushViewController:TransactionsListPage animated:YES];
        
    }
    
    else if(sender == Settings)
    {
        NSLog(@"Settings Button Pressed");
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        EPTReminderPageViewController *ReminderPage = [storyboard instantiateViewControllerWithIdentifier:@"ReminderPage"];
        
        [self.navigationController pushViewController:ReminderPage animated:YES];
        
    }
    
    else
    {
        NSLog(@"Some Other Button");
    }
    
    
}
@end
