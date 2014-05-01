//
//  MGNotificationCenter.h
//  MGNotificationCenterExample
//
//  Created by matteogobbi on 29/04/2014.
//  Copyright (c) 2014 matteogobbi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGNotificationCenter : NSNotificationCenter

- (NSUInteger)count;
- (NSUInteger)countForName:(NSString *)name;
- (NSArray *)allNames;
- (NSArray *)allNamesForObserver:(id)observer;

@end
