#import "ViewController.h"
#import "GreenViewController.h"

@implementation ViewController

- (void) send : (NSString *)message
{
    receiveMessageLabel.text = message;
}

-(IBAction)gotoGreenAction:(id)sender
{
    [self performSegueWithIdentifier:@"greenSegueId" sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    GreenViewController *greenInstance = [segue destinationViewController];
    greenInstance.delegate = self;
    
}

@end
