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
    
        
    PrettySlide *slide1 =[[PrettySlide alloc] initWithForegroundView:[self foregroundViewWithTitle:@"Leopard" body:@"watch me slink"] backgroundView:[self backgroundViewWithImage:[UIImage imageNamed:@"leopard"]]];
    PrettySlide *slide2 =[[PrettySlide alloc] initWithForegroundView:[self foregroundViewWithTitle:@"Snow Leopard" body:@"I have no idea what I'm doing"] backgroundView:[self backgroundViewWithImage:[UIImage imageNamed:@"snowLeopard"]]];
    PrettySlide *slide3 =[[PrettySlide alloc] initWithForegroundView:[self foregroundViewWithTitle:@"Lion" body:@"I'll admit that some of this hair is weave"] backgroundView:[self backgroundViewWithImage:[UIImage imageNamed:@"lion"]]];
    PrettySlide *slide4 =[[PrettySlide alloc] initWithForegroundView:[self foregroundViewWithTitle:@"Mountain Lion" body:@"Being In this tree amplifies my patronising ability"] backgroundView:[self backgroundViewWithImage:[UIImage imageNamed:@"mountainLion"]]];


    return @[slide1,slide2,slide3,slide4];
}


//Demo foreground and background views
-(UIView *)foregroundViewWithTitle:(NSString *)title body:(NSString *)body{
    UIView *foreGroundView=[[UIView alloc] initWithFrame:CGRectMake(20, 380, 280, 200)];
    foreGroundView.backgroundColor=[UIColor clearColor];
    CGRect frame=foreGroundView.bounds;
    frame.size.height=20;
    UILabel * label=[[UILabel alloc] initWithFrame:frame];
    label.backgroundColor=[UIColor clearColor];
    label.textAlignment=UITextAlignmentCenter;
    label.font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
    label.text=title;
    label.textColor=[UIColor whiteColor];
    [foreGroundView addSubview:label];
    
    frame=foreGroundView.bounds;
    frame.size.height=50;
    frame.origin.y=20;
    UITextView * bodyLabel=[[UITextView alloc] initWithFrame:frame];
    bodyLabel.backgroundColor=[UIColor clearColor];
    bodyLabel.textAlignment=UITextAlignmentCenter;
    bodyLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    bodyLabel.text=body;
    bodyLabel.textColor=[UIColor whiteColor];
    bodyLabel.userInteractionEnabled=FALSE;
    [foreGroundView addSubview:bodyLabel];

    return foreGroundView;
}

-(UIView *)backgroundViewWithImage:(UIImage *)image{
    UIView *backgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    backgroundView.clipsToBounds=FALSE;
    UIImageView  *immy=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    immy.image=image;
    immy.contentMode=UIViewContentModeScaleAspectFill;
    [backgroundView addSubview:immy];

    return backgroundView;
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
