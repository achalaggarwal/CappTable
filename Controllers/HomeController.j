@import "../Models/DataAPI.j"

@implementation HomeController : CPViewController {
  @outlet CPImageView mainImage;
  @outlet CPTableView citiesList;
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
  [citiesList reloadData];
}

- (int)numberOfRowsInTableView:(CPTableView)aTableView {
  return [[[DataAPI shared] citiesArray] count];
}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(CPTableColumn)aColumn row:(int)aRowIndex {
  return [[[DataAPI shared] citiesArray] objectAtIndex:aRowIndex];
}

@end
