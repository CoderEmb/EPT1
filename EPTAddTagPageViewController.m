//
//  EPTAddTagPageViewController.m
//  EPT1
//
//  Created by Rushi Rawal on 12/17/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import "EPTAddTagPageViewController.h"
#import "CategoryTags.h"
#import "EPTAppDelegate.h"

@interface EPTAddTagPageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *CancelButton;
@property (weak, nonatomic) IBOutlet UIButton *DoneButton;
@property (weak, nonatomic) IBOutlet UITextField *AddTagName;

@end

@implementation EPTAddTagPageViewController

@synthesize CancelButton;
@synthesize DoneButton;
@synthesize AddTagName;
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
    NSLog(@"inside btnPressed for add transaction page");
    
    if(sender == CancelButton)
    {
        NSLog(@"Cancel Button Pressed on add tag page");
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    else if(sender == DoneButton)
    {
        NSLog(@"Done Button Pressed");
        
        NSString* TagName = self.AddTagName.text;
        
        CategoryTags * newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"CategoryTags"
                                                            inManagedObjectContext:self.managedObjectContext];
        //  2
        newEntry.sTagName = TagName;
        
        //  3
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
        
        
        NSLog(@"%@", TagName);
        
        
        //[toAddtoAccounts AddToAccountsArray:AccountName :OpeningBalance];
        
        [self.navigationController popViewControllerAnimated:YES];

    }
    else
    {
        
        NSLog(@"Some Other Button");
        
    }
    
    
    
}

@end
