//
//  AppDelegate.m
//  TopPictureTest
//
//  Created by Daniel Langh on 14/04/15.
//  Copyright (c) 2015 rumori. All rights reserved.
//

#import "AppDelegate.h"


#import "ExampleTableViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ExampleTableViewController *vc = [ExampleTableViewController new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
