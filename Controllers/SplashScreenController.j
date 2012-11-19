@implementation SplashScreenController : CPViewController {
  @outlet CPImageView splashImage;
}

- (void) viewDidLoad {
  [super viewDidLoad];
}

- (void) hello {
  [[CPNotificationCenter defaultCenter] postNotificationName:@"DISMISS_SPLASH_SCREEN" object:nil];
}

- (void)awakeFromCib {
  //Add Image to ImageView

  [[self view] setBackgroundColor:[CPColor colorWithHexString:@"FFFFE6"]];

  var mainBundle = [CPBundle mainBundle];
  var path = [mainBundle pathForResource:@"splashScreen.jpg"];
  var image1 = [[CPImage alloc] initWithContentsOfFile:path];
  [splashImage setImage:image1];
  [splashImage setImageScaling:CPScaleToFit];
  [self performSelector:@selector(hello) afterDelay:2];
}

@end
