#import <UIKit/UIKit.h>
#import "Protocol.h"

@interface GreenViewController : UIViewController
{
    IBOutlet UITextField *sendTxtFld;
}

@property (nonatomic) id <sendingMessageProtocol> delegate;

-(IBAction)gotoBackAction:(id)sender;

@end


