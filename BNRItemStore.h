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

@property (nonatomic, readonly, copy) NSArray *allItems;

-(BNRItem *)createItem;
-(void)removeItem:(BNRItem *)item;

-(void)moveItemAtIndex:(NSUInteger)fromIndex
               toIndex:(NSUInteger)toIndex;

@end
