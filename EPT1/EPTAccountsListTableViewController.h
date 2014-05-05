//
//  EPTAccountsListTableViewController.h
//  EPT1
//
//  Created by Rushi Rawal on 12/11/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EPTAccountsListTableViewController : UITableViewController

@property (nonatomic,retain) IBOutlet UIBarButtonItem* AddAccounts;
//@property (nonatomic, strong) NSMutableArray *ExistingAccounts;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
//@property (nonatomic,strong)NSArray* fetchedRecordsArray;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

-(IBAction)btnPressed :(id)sender;
-(void)AddToAccountsArray : (NSString*)AccountName : (NSUInteger)OpeningBalance;
-(NSArray*)getAccountInfo;

@end
