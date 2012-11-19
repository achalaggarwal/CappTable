@implementation SplashScreenController : CPViewController {
  @outlet CPImageView splashImage;
}

- (void) viewDidLoad {
  [super viewDidLoad];
  CPLog(@"dismiss splash screen controller after 2 seconds.");
  [self performSelector:@selector(hello) afterDelay:1];
}

- (void) hello {
  [[CPNotificationCenter defaultCenter] postNotificationName:@"DISMISS_SPLASH_SCREEN" object:nil];
}

- (void)awakeFromCib {
  //Add Image to ImageView
  var mainBundle = [CPBundle mainBundle];
  var path = [mainBundle pathForResource:@"splashScreen.jpg"];
  var image1 = [[CPImage alloc] initWithContentsOfFile:path];
  [splashImage setImage:image1];
  [splashImage setImageScaling:CPScaleToFit];
}

@end
