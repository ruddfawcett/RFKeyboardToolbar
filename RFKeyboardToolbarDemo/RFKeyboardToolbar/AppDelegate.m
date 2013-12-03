//
//  AppDelegate.m
//  RFKeyboardToolbarDemo
//
//  Created by Rex Finn on 12/3/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *viewController = [[ViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    self.window.rootViewController = navController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
