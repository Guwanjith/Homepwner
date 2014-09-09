//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Guwanjith Tennekoon on 9/9/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject

+(instancetype)sharedStore;
-(BNRItem *)createItem;
-(NSArray *)allItems;

@end
