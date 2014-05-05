//
//  Transactions.h
//  EPT1
//
//  Created by Rushi Rawal on 12/14/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Accounts;

@interface Transactions : NSManagedObject

@property (nonatomic, retain) NSNumber * sTransactionID;
@property (nonatomic, retain) NSNumber * iAmount;
@property (nonatomic, retain) NSDate * dDate;
@property (nonatomic, retain) NSString * sTranType;
@property (nonatomic, retain) NSNumber * iTagID;
@property (nonatomic, retain) NSNumber * iAccountID;
@property (nonatomic, retain) Accounts *iTrantoAcc;
@property (nonatomic, retain) NSSet *sTranToTag;
@end

@interface Transactions (CoreDataGeneratedAccessors)

- (void)addSTranToTagObject:(NSManagedObject *)value;
- (void)removeSTranToTagObject:(NSManagedObject *)value;
- (void)addSTranToTag:(NSSet *)values;
- (void)removeSTranToTag:(NSSet *)values;

@end
