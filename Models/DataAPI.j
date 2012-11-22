var dataAPI = nil;

@implementation DataAPI : CPObject {
  CPURLConnection citiesConnection;
  CPURLConnection restaurantConnection;

  CPDictionary cities;
}

+ (id) shared {
  if (dataAPI == nil) {
    dataAPI = [[DataAPI alloc] init];
  }
  return dataAPI;
}

- (void) fetchCities {
  var request = [[CPURLRequest alloc] initWithURL:@"http://opentable.heroku.com/api/cities"];
  [request setHTTPMethod:@"GET"];
  // [request setHTTPBody:@"value"];
  // [request setValue:"5" forHTTPHeaderField:@"Content-Length"];
  // [request setValue:"text/plain;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

  citiesConnection = [CPURLConnection connectionWithRequest:request delegate:self];
  [citiesConnection start];
}

- (CPArray) citiesArray {
  CPLog(cities);
  return nil;
}

-(void)connection:(CPURLConnection)connection didFailWithError:(id)error {
  CPLog(error);
}

-(void)connection:(CPURLConnection)connection didReceiveResponse:(CPHTTPURLResponse)response {
}

-(void)connection:(CPURLConnection)connection didReceiveData:(CPString)data {
  switch(connection) {
    case citiesConnection:
    cities = [CPDictionary dictionaryWithJSObject:data recursively:NO];
    [[CPNotificationCenter defaultCenter] postNotificationName:@"RELOAD_CITIES" object:nil];
    break;

    case restaurantConnection:

    break;
  }
}

-(void)connectionDidFinishLoading:(CPURLConnection)connection {
}

- (void) fetchRestaurantsInCity:(CPString) cityName {

}

@end
