//
//  CategoryTags.h
//  EPT1
//
//  Created by Rushi Rawal on 12/14/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Transactions;

@interface CategoryTags : NSManagedObject

@property (nonatomic, retain) NSNumber * iTagID;
@property (nonatomic, retain) NSString * sTagName;
@property (nonatomic, retain) NSSet *iTagToTran;
@end

@interface CategoryTags (CoreDataGeneratedAccessors)

- (void)addITagToTranObject:(Transactions *)value;
- (void)removeITagToTranObject:(Transactions *)value;
- (void)addITagToTran:(NSSet *)values;
- (void)removeITagToTran:(NSSet *)values;

@end
