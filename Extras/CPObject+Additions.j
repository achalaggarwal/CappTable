@import <Foundation/Foundation.j>
@implementation CPObject (Additions)

- (CPTimer) performSelector:(SEL)inSelector withObject:(id)anObject afterDelay:(CPTimeInterval)delayInSeconds {
  setTimeout(function  () {
    [self performSelector:inSelector withObject:anObject];
  }, delayInSeconds * 1000);
}

- (CPTimer) performSelector:(SEL)inSelector afterDelay:(CPTimeInterval)delayInSeconds {
  setTimeout(function  () {
    [self performSelector:inSelector];
  }, delayInSeconds * 1000);
}

@end
