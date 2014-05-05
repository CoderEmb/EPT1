//
//  EPTAppDelegate.m
//  EPT1
//
//  Created by Rushi Rawal on 12/8/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import "EPTAppDelegate.h"
#import "EPTAccount.h"
#import <UIKit/UIKit.h>
@implementation EPTAppDelegate

//@synthesize ExistingAccounts;
@synthesize managedOB;
@synthesize managedOBCon;
@synthesize persStCo;

// 1
- (NSManagedObjectContext *) managedObjectContext {
    if (managedOBCon != nil) {
        return managedOBCon;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedOBCon = [[NSManagedObjectContext alloc] init];
        [managedOBCon setPersistentStoreCoordinator: coordinator];
    }
    
    return managedOBCon;
}

//2
- (NSManagedObjectModel *)managedObjectModel {
    if (managedOB != nil) {
        return managedOB;
    }
    managedOB = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return managedOB;
}

//3
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (persStCo != nil) {
        return persStCo;
    }
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
                                               stringByAppendingPathComponent: @"Expenses.sqlite"]];
    NSError *error = nil;
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
    						 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
    						 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    persStCo = [[NSPersistentStoreCoordinator alloc]
                                   initWithManagedObjectModel:[self managedObjectModel]];
    if(![persStCo addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil URL:storeUrl options:options
                                                  error:&error]) {
        /*Error for store creation should be handled in here*/
    }
    
    return persStCo;
}

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];*/
    //self.ExistingAccounts = [[NSMutableArray alloc] init];
    managedOBCon = [self managedObjectContext];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"window-dentist-background.jpg"]];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
