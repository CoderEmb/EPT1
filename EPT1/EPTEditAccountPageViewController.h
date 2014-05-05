//
//  EPTEditAccountPageViewController.h
//  EPT1
//
//  Created by Rushi Rawal on 12/19/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Accounts.h"

@interface EPTEditAccountPageViewController : UIViewController

@property (nonatomic,retain) IBOutlet UIButton* CancelButton;
@property (nonatomic,retain) IBOutlet UIButton* DoneButton;
@property (nonatomic, strong)Accounts *selectedAccount;
-(IBAction)btnPressed :(id)sender;





@end
