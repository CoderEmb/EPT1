//
//  EPTAccountsListTableViewController.m
//  EPT1
//
//  Created by Rushi Rawal on 12/11/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import "EPTAccountsListTableViewController.h"
#import "EPTAddAccountPageViewController.h"
#import "EPTEditAccountPageViewController.h"
#import "EPTAccount.h"
#import "EPTAppDelegate.h"
#import "Accounts.h"


@interface EPTAccountsListTableViewController ()


@end

@implementation EPTAccountsListTableViewController

@synthesize AddAccounts;
@synthesize managedObjectContext;
@synthesize fetchedResultsController;
//@synthesize fetchedRecordsArray;
//@synthesize ExistingAccounts;

NSUInteger arrayIndex = 0;

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (fetchedResultsController != nil) {
        return fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Accounts" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"sAccountName" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:managedObjectContext sectionNameKeyPath:nil
                                                   cacheName:@"Root"];
    self.fetchedResultsController = theFetchedResultsController;
    fetchedResultsController.delegate = self;
    
    return fetchedResultsController;
    
}

-(void) AddToAccountsArray:(NSString *)AccountName :(NSUInteger)OpeningBalance
{
    
    NSLog(@"%@", AccountName);
    NSLog(@"%d", OpeningBalance);
    //self.ExistingAccounts = [[NSMutableArray alloc] init];
    
    EPTAccount *NewAccount = [[EPTAccount alloc] init];
    NewAccount.accountName = AccountName;
    NewAccount.OpeningBalance = OpeningBalance;
    
    EPTAppDelegate *myEPTAppDelegate =
    (EPTAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    //[[myEPTAppDelegate ExistingAccounts] addObject:NewAccount];
    
    //NSLog(@"%@",  [[myEPTAppDelegate ExistingAccounts] lastObject]);
    
    //NSLog(@"%d",  [[myEPTAppDelegate ExistingAccounts] count]);
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    //self.fetchedRecordsArray = [self getAccountInfo];

    [self.tableView reloadData];
    
    [self.navigationController setToolbarHidden:NO animated:YES];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES animated:YES];
}

- (void)viewDidUnload
{
    self.fetchedResultsController = nil;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image1.jpg"]];
    
    self.tableView.alwaysBounceVertical = NO;
    self.tableView.scrollEnabled = YES;
    EPTAppDelegate *myEPTAppDelegate =
    (EPTAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    managedObjectContext = myEPTAppDelegate.managedOBCon;
    
    NSError *error;
	if (![[self fetchedResultsController] performFetch:&error]) {
		// Update to handle the error appropriately.
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1);  // Fail
	}
    
    [self.navigationController setToolbarHidden:NO animated:YES];
    
    self.title = @"Accounts";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    
    //EPTAppDelegate *myEPTAppDelegate = (EPTAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    //return [fetchedRecordsArray count];
    //return [[myEPTAppDelegate ExistingAccounts] count];
    
    id  sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Accounts *info = [fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = info.sAccountName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",
                                 info.iCurBalance];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AccountInfoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //EPTAppDelegate *myEPTAppDelegate =
    //(EPTAppDelegate*)[[UIApplication sharedApplication] delegate];

    //EPTAccount *thisAccount = [[myEPTAppDelegate ExistingAccounts] objectAtIndex:indexPath.row];
    
    //NSLog(@"%d,%d", indexPath.row,indexPath.section);
    
    //NSLog(@"%@",  [[myEPTAppDelegate ExistingAccounts] objectAtIndex:indexPath.row]);
    
    /* Commented out after introducing fetchedResultsController
    Accounts *acc = [fetchedRecordsArray objectAtIndex:indexPath.row];
    
    NSString *curBal = [acc.iCurBalance stringValue];
    
    cell.textLabel.text = [acc.sAccountName stringByAppendingFormat:@"               %@", curBal];
    //cell.textLabel.text = [ [acc.sAccountName] stringByAppendingFormat:@" (%d)",[acc.iCurBalance int]   ];*/
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

-(NSArray*)getAccountInfo
{
        // initializing NSFetchRequest
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        //Setting Entity to be Queried
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Accounts"
                                                  inManagedObjectContext:self.managedObjectContext];
        [fetchRequest setEntity:entity];
        NSError* error;
        
        // Query on managedObjectContext With Generated fetchRequest
        NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        // Returning Fetched Records
        return fetchedRecords;
}

-(IBAction)btnPressed :(id)sender
{
    NSLog(@"inside btnPressed");
    
    if(sender == AddAccounts)
    {
        NSLog(@"Add Acc Pressed");
        
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        EPTAddAccountPageViewController *AddAccounPage = [storyBoard instantiateViewControllerWithIdentifier:@"AddAccount"];
        
        
        [self.navigationController pushViewController:AddAccounPage animated:YES];
        
    }
    else
    {
        NSLog(@"Some Other Button");
    }
    
    
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    EPTEditAccountPageViewController *EditAccounPage = [storyBoard instantiateViewControllerWithIdentifier:@"EditAccountPage"];
    
    EditAccounPage.selectedAccount = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    [self.navigationController pushViewController:EditAccounPage animated:YES];
    
    
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.managedObjectContext deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![self.managedObjectContext save:&error]) {
            // handle error
        }
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.tableView endUpdates];
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
