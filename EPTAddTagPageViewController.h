//
//  EPTAddTagPageViewController.h
//  EPT1
//
//  Created by Rushi Rawal on 12/17/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPTAddTagPageViewController : UIViewController

-(IBAction)btnPressed :(id)sender;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
