//
//  MGNotificationCenter.m
//  MGNotificationCenterExample
//
//  Created by matteogobbi on 29/04/2014.
//  Copyright (c) 2014 matteogobbi. All rights reserved.
//

#import "MGNotificationCenter.h"

@implementation MGNotificationCenter {
    NSMutableDictionary *_dictObservers;
}

- (instancetype)init
{
    if(self = [super init]) {
        _dictObservers = [NSMutableDictionary new];
    }
    
    return self;
}

#pragma mark - NSNotification Center methods

- (id)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *))block
{
    id observer = [super addObserverForName:name object:obj queue:queue usingBlock:block];
    [self mg_storeObserver:observer forName:name];
    
    return observer;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
{
    [self mg_storeObserver:observer forName:aName];
    [super addObserver:observer selector:aSelector name:aName object:anObject];
}

- (void)removeObserver:(id)observer
{
    [_dictObservers enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSMutableSet *setObservers = obj;
        [setObservers removeObject:observer];
    }];
    
    [super removeObserver:observer];
}

- (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject
{
    NSMutableSet *setObservers = [_dictObservers objectForKey:aName];
    [setObservers removeObject:observer];
    
    [super removeObserver:observer name:aName object:anObject];
}

#pragma mark - New public methods

- (NSUInteger)count
{
    __block NSUInteger sum = 0;
    [_dictObservers enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSMutableSet *setObservers = obj;
        sum += [setObservers count];
    }];
    return sum;
}

- (NSUInteger)countForName:(NSString *)name
{
    NSSet *setObserver =  [_dictObservers objectForKey:name];
    return [setObserver count];
}

- (NSArray *)allNames
{
    return [_dictObservers allKeys];
}

- (NSArray *)allNamesForObserver:(id)observer
{
    __block NSMutableArray *arrayNames = [NSMutableArray new];
    [_dictObservers enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSMutableSet *setObservers = obj;
        if ([setObservers containsObject:observer]) {
            [arrayNames addObject:key];
        }
    }];
    return [arrayNames copy];
}

#pragma mark - Private methods

- (void)mg_storeObserver:(id)observer forName:(NSString *)name
{
    NSMutableSet *setObservers = nil;
    if ((setObservers = [_dictObservers valueForKey:name])) {
        [setObservers addObject:observer];
    } else {
        NSMutableSet *newSetObservers = [[NSMutableSet alloc] initWithObjects:observer, nil];
        [_dictObservers setObject:newSetObservers forKey:name];
    }
}

@end
