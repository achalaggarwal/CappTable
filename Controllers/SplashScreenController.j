
@import "../Models/DataAPI.j"

DISMISS_SPLASH_SCREEN_NOTIFICATION = @"DISMISS_SPLASH_SCREEN";

@implementation SplashScreenController : CPViewController {
  @outlet CPImageView splashImage;
}

- (void) viewDidLoad {
  [super viewDidLoad];
}

- (void) dismissSelf {
  [[DataAPI shared] fetchCities];
  [[CPNotificationCenter defaultCenter] postNotificationName:DISMISS_SPLASH_SCREEN_NOTIFICATION object:nil];
}

- (void)awakeFromCib {
  //Add Image to ImageView

  [[self view] setBackgroundColor:[CPColor colorWithHexString:@"FFFFE6"]];

  var mainBundle = [CPBundle mainBundle];
  var path = [mainBundle pathForResource:@"splashScreen.jpg"];
  var image1 = [[CPImage alloc] initWithContentsOfFile:path];
  [splashImage setImage:image1];
  [splashImage setImageScaling:CPScaleToFit];
  [self performSelector:@selector(dismissSelf) afterDelay:2];
}

@end
