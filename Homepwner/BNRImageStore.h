//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Guwanjith Tennekoon on 9/11/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image
          forKey:(NSString *)key;

- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;


@end
