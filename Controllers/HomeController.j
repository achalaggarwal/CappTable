@import "../Models/DataAPI.j"

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

  [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:@"RELOAD_CITIES" object:nil];

  //start loading the data here
  //reload table
}

- (void)reloadData:(CPNotification) aNotification {
  CPLog(@"I am here");
  CPLog([[DataAPI shared] citiesArray]);
}

- (int)numberOfRowsInTableView:(CPTableView)aTableView {
  return 500;
}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(CPTableColumn)aColumn row:(int)aRowIndex {
  return @"Hello City Name " + aRowIndex;
}

@end
