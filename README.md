MGNotificationCenter
====================

The goal of this object, is to extend the NSNotificationCenter adding new functionality to be the life of the developer easier.

# Info

This code must be used under ARC. 
If your code doesn't use ARC you can [mark this source with the compiler flag](http://www.codeography.com/2011/10/10/making-arc-and-non-arc-play-nice.html) `-fobjc-arc` 

## Example Usage

In the package is included the project to test the object.

``` objective-c
    NSUInteger count = [[MGNotificationCenter defaultCenter] count];
    NSLog(@"Count: %lu", (unsigned long)count);
    
    NSUInteger countForName = [[MGNotificationCenter defaultCenter] countForName:@"name1"];
    NSLog(@"CountForName: %lu", (unsigned long)countForName);
    
    NSArray *names = [[MGNotificationCenter defaultCenter] allNames];
    NSLog(@"Names: %@", names);
    
    NSArray *namesForObserver = [[MGNotificationCenter defaultCenter] allNamesForObserver:self];
    NSLog(@"NamesForObserver: %@", namesForObserver);
```

## Contact

Matteo Gobbi

- http://www.matteogobbi.it
- http://github.com/matteogobbi
- http://twitter.com/matteo_gobbi
- https://angel.co/matteo-gobbi
- http://www.linkedin.com/profile/view?id=24211474

## License

MGNotificationCenter is available under the MIT license.
