#import <Foundation/Foundation.h>

@interface Car : NSObject

@property NSString *name;
@property Boolean isOn;

-(void)turnEngineOn;
-(instancetype) initWithState : (Boolean) starState;
@end

@implementation Car
-(void)turnEngineOn
{
    _isOn = true;
}
-(instancetype) initWithState : (Boolean) starState
{
    self = [super init];
    _isOn = starState;
    return self;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Car *jeep = [[Car alloc]init];
        Car *corolla = [[Car alloc] initWithState:true];
        // insert code here...
        NSLog(@"corolla.turnEngineOn");
    }
    return 0;
}
