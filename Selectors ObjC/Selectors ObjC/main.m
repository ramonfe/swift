#import <Foundation/Foundation.h>
#import "Car.h"
#import "Building.h"
#import "Person.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Car *jeep = [Car new];
        Person *amir = [Person new];
        Building *empire = [Building new];
        
        NSMutableArray *myArr = [[NSMutableArray alloc] initWithObjects:
                                 jeep,
                                 amir,
                                 empire, nil];
        
        for (int i = 0; i < myArr.count ; i++)
        {
            if ( [myArr[i] respondsToSelector: @selector(eat)])
            {
                // then eat
            }
        }

        for (id each in myArr)
        {
            if ( [each isKindOfClass: [Building class]])
            {
                // building turn lights on
            }
        }

        
    }
    return 0;
}
