//
//  EPTTransactionsListTableViewController.h
//  EPT1
//
//  Created by Rushi Rawal on 12/19/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EPTTransactionsListTableViewController : UITableViewController

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
