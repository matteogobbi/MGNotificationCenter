//
//  MGFirstViewController.m
//  MGNotificationCenterExample
//
//  Created by matteogobbi on 29/04/2014.
//  Copyright (c) 2014 matteogobbi. All rights reserved.
//

#import "MGFirstViewController.h"
#import "MGNotificationCenter.h"

@interface MGFirstViewController ()

@end

@implementation MGFirstViewController {
    id anObserver;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Add observer
    [[MGNotificationCenter defaultCenter] addObserver:self selector:nil name:@"name1" object:nil];
    
    //Add obbserver with block
    anObserver = [[MGNotificationCenter defaultCenter] addObserverForName:@"name3" object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSLog(@"Something");
    }];
    
    //Get an array of names for a certain observer
    NSArray *namesForObserver = [[MGNotificationCenter defaultCenter] allNamesForObserver:anObserver];
    NSLog(@"NamesForObserver: %@", namesForObserver);
    
    //Post
    [[MGNotificationCenter defaultCenter] postNotificationName:@"name3" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
