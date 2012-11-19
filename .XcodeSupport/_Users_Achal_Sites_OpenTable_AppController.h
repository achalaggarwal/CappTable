#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "xcc_general_include.h"

@interface AppController : NSObject

@property (assign) IBOutlet NSWindow* theWindow;
@property (assign) IBOutlet HomeController* homeController;
@property (assign) IBOutlet SplashScreenController* splashScreenController;
@property (assign) IBOutlet RestaurantListController* restaurantListController;

@end
