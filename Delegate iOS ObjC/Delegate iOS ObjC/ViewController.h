#import <UIKit/UIKit.h>
#import "Protocol.h"

@interface ViewController : UIViewController <sendingMessageProtocol>
{
    IBOutlet UILabel *receiveMessageLabel;
}


-(IBAction)gotoGreenAction:(id)sender;

@end

