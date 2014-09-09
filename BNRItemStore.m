//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Guwanjith Tennekoon on 9/9/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import "BNRItemStore.h"

@implementation BNRItemStore

+(instancetype)sharedStore
{
    static BNRItemStore *sharedStore;
    
    //Do i need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

//Call an error if someone tries to use [[BNRItemStore alloc] init]
-(instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[BNRItemStore sharedStore]"];
    return nil;
}

//Here is the real (secret) initializer
-(instancetype)initPrivate
{
    self = [super init];
    return self;
}

@end
