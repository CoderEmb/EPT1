//
//  EPTAccount.h
//  EPT1
//
//  Created by Rushi Rawal on 12/8/13.
//  Copyright (c) 2013 Rushi Rawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPTTransaction.h"

@interface EPTAccount : NSObject

@property NSUInteger CurrentBalance;
@property NSUInteger OpeningBalance;
@property NSString *accountName;
@property NSMutableArray *EPTTransaction;


@end
