@implementation SplashScreenController : CPViewController {
  @outlet CPImageView splashImage;
}

- (void) viewDidLoad {
  [super viewDidLoad];
  CPLog(@"dismiss splash screen controller after 2 seconds.");
  [self performSelector:@selector(hello) afterDelay:3];
}

- (void) hello {
  CPLog(@"dismiss this controller");
}

- (void) loadView {
  [super loadView];
  CPLog(@"hello world");
}

- (void)awakeFromCib {
  CPLog(@"in SplashScreenController");
}

@end
