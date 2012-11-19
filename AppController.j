/*
 * AppController.j
 * OpenTable
 *
 * Created by You on November 19, 2012.
 * Copyright 2012, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

@import "./Controllers/HomeController.j"
@import "./Controllers/SplashScreenController.j"
@import "./Controllers/RestaurantListController.j"
@import "./Extras/CPObject+Additions.j"


@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
    @outlet HomeController homeController;
    @outlet SplashScreenController splashScreenController;
    @outlet RestaurantListController restaurantListController;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
    [self setup];
}

- (void) setup {
    [self registerForNotifications];
}

- (void) registerForNotifications {
    [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissSplash:) name:@"DISMISS_SPLASH_SCREEN" object:nil];
}

- (void) dismissSplash:(CPNotification) aNotification {
    var splashView = [splashScreenController view];
    var startFrame = [splashView frame];

    var endFrame = CGRectMake(0, 2*CGRectGetHeight(startFrame), CGRectGetWidth(startFrame), CGRectGetHeight(startFrame));

    var animation = [[CPViewAnimation alloc] initWithViewAnimations:[
       [CPDictionary dictionaryWithJSObject:{
           CPViewAnimationTargetKey:splashView,
           CPViewAnimationStartFrameKey:startFrame,
           CPViewAnimationEndFrameKey:endFrame
       }]
    ]];

    [animation setAnimationCurve:CPAnimationEaseInOut];
    [animation setDuration:0.5];
    [animation startAnimation];
}

@end
