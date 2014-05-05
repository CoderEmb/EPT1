//
//  EPTHomePageViewController.h
//  EPT1
//
//  Created by Rushi Rawal on 12/10/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPTHomePageViewController : UIViewController

@property (nonatomic,retain) IBOutlet UIBarButtonItem* Accounts;
@property (nonatomic,retain) IBOutlet UIBarButtonItem* Settings;
@property (nonatomic,retain) IBOutlet UIButton* AddTransaction;
@property (nonatomic,retain) IBOutlet UIButton* Reports;


-(IBAction)btnPressed :(id)sender;



@end
