//
//  Accounts.h
//  EPT1
//
//  Created by Rushi Rawal on 12/14/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Transactions;

@interface Accounts : NSManagedObject

@property (nonatomic, retain) NSString * sAccountName;
@property (nonatomic, retain) NSNumber * iCurBalance;
@property (nonatomic, retain) NSNumber * iAccountID;
@property (nonatomic, retain) NSString * sAccountType;
@property (nonatomic, retain) NSSet *sAccToTran;
@end

@interface Accounts (CoreDataGeneratedAccessors)

- (void)addSAccToTranObject:(Transactions *)value;
- (void)removeSAccToTranObject:(Transactions *)value;
- (void)addSAccToTran:(NSSet *)values;
- (void)removeSAccToTran:(NSSet *)values;

@end
