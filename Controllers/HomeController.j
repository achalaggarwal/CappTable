@implementation HomeController : CPViewController {
  @outlet CPImageView mainImage;
}

- (void) viewDidLoad {
  [super viewDidLoad];
}

- (void)awakeFromCib {
  var mainBundle = [CPBundle mainBundle];
  var path = [mainBundle pathForResource:@"home_landscape.jpg"];
  var image1 = [[CPImage alloc] initWithContentsOfFile:path];
  [mainImage setImage:image1];
  [mainImage setImageScaling:CPScaleToFit];
  //start loading the data here
  //reload table
}

- (int)numberOfRowsInTableView:(CPTableView)aTableView {
  return 50;
}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(CPTableColumn)aColumn row:(int)aRowIndex {
  return @"Hello City Name";
}

@end
