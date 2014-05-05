//
//  EPTTransaction.h
//  EPT1
//
//  Created by Rushi Rawal on 12/8/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EPTTransaction : NSObject

@property NSUInteger transactionId;
@property NSString   *sourceAcc;
@property NSString   *destAcc;
@property NSDate     *transactionDate;
@property NSUInteger transactionAmt;
typedef enum {credit, debit}transactionType;

@end
