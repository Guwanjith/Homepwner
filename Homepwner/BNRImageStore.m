//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Guwanjith Tennekoon on 9/11/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore

+ (instancetype)sharedStore
{
    static BNRImageStore *sharedStore;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

//No one should call init
-(instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[BNRImageStore sharedStore]"];
    return nil;
}

//secret initializer
-(instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setImage:(UIImage *)image
          forKey:(NSString *)key
{
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}
@end
