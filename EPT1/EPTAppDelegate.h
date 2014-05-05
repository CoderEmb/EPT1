//
//  EPTAppDelegate.h
//  EPT1
//
//  Created by Rushi Rawal on 12/8/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EPTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//@property (nonatomic, strong) NSMutableArray *ExistingAccounts;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedOB;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedOBCon;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persStCo;


@end
