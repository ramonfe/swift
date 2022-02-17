#import "GreenViewController.h"

@implementation GreenViewController

-(IBAction)gotoBackAction:(id)sender
{
    NSString *textToSend = sendTxtFld.text;
    [self.delegate send: textToSend];
    
    [self dismissViewControllerAnimated:true
                             completion:nil];
}
@end
