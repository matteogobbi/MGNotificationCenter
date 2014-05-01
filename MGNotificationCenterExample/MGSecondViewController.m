//
//  MGSecondViewController.m
//  MGNotificationCenterExample
//
//  Created by matteogobbi on 29/04/2014.
//  Copyright (c) 2014 matteogobbi. All rights reserved.
//

#import "MGSecondViewController.h"
#import "MGNotificationCenter.h"

@interface MGSecondViewController ()

@end

@implementation MGSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSUInteger count = [[MGNotificationCenter defaultCenter] count];
    NSLog(@"Count: %lu", (unsigned long)count);
    
    NSUInteger countForName = [[MGNotificationCenter defaultCenter] countForName:@"name1"];
    NSLog(@"CountForName: %lu", (unsigned long)countForName);
    
    NSArray *names = [[MGNotificationCenter defaultCenter] allNames];
    NSLog(@"Names: %@", names);
    
    NSArray *namesForObserver = [[MGNotificationCenter defaultCenter] allNamesForObserver:self];
    NSLog(@"NamesForObserver: %@", namesForObserver);
}

@end
