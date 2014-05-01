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
    
    [[MGNotificationCenter defaultCenter] addObserver:self selector:nil name:@"name1" object:nil];
    [[MGNotificationCenter defaultCenter] addObserver:self selector:nil name:@"name2" object:nil];
    
    NSUInteger count = [[MGNotificationCenter defaultCenter] count];
    NSUInteger countForName = [[MGNotificationCenter defaultCenter] countForName:@"name1"];
    
    NSLog(@"Count: %lu", (unsigned long)count);
    NSLog(@"CountForName: %lu", (unsigned long)countForName);
    
    NSArray *names = [[MGNotificationCenter defaultCenter] allNames];
    NSArray *namesForObserver = [[MGNotificationCenter defaultCenter] allNamesForObserver:self];
    
    NSLog(@"Names: %@", names);
    NSLog(@"NamesForObserver: %@", namesForObserver);
}

@end
