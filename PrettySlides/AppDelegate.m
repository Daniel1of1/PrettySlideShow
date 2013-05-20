//
//  AppDelegate.m
//  PrettySlides
//
//  Created by Daniel Haight on 20/05/2013.
//  Copyright (c) 2013 confidence. All rights reserved.
//

#import "AppDelegate.h"

#import "PrettySlideShowViewController.h"
#import "PrettySlide.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    NSArray *slides=[self slidesArray];
    
    self.viewController = [[PrettySlideShowViewController alloc] initWithSlides:slides];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

-(NSArray *)slidesArray{
    PrettySlide *slide1 =[[PrettySlide alloc] initWithTitle:@"The corner" body:@"it has couches and stuff :P" image:[UIImage imageNamed:@"gg1"]];
    PrettySlide *slide2 =[[PrettySlide alloc] initWithTitle:@"Pixels" body:@"lots of pixels and stuff" image:[UIImage imageNamed:@"gg2"]];
    PrettySlide *slide3 =[[PrettySlide alloc] initWithTitle:@"Chair facing window" body:@"it is a chair, that is facing a window, oooo look at the sun!" image:[UIImage imageNamed:@"gg3"]];
    PrettySlide *slide4 =[[PrettySlide alloc] initWithTitle:@"bleh" body:@"aasdfjlk;" image:[UIImage imageNamed:@"gg4"]];
    return @[slide1,slide2,slide3,slide4];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
