//
//  ViewController.m
//  FastestRPM
//
//  Created by Benson Huynh on 2015-10-29.
//  Copyright © 2015 Benson Huynh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *speedometerImg;
@property (weak, nonatomic) IBOutlet UIImageView *needle;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panAction;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.needle.transform =CGAffineTransformMakeRotation(3*M_PI_4);
    
    //
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)fingerPan:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateChanged ) {

    double rangeOfSpeed = 10000;
    double fullCircle = 2*M_PI;
    double startPoint = (3*M_PI_4);
    double endRange = M_PI_4;
    double speedDialRange = fullCircle - (startPoint - endRange);
    CGPoint vector = [sender velocityInView:self.view];
  double velocity = sqrt((vector.x * vector.x) + (vector.y * vector.y));
    NSLog(@"speed is %f km/hr", velocity);
    
   double dialPercentage = velocity/rangeOfSpeed;
    
  double actualSpeed = (speedDialRange * dialPercentage) + startPoint;
    
    self.needle.transform = CGAffineTransformMakeRotation(actualSpeed);
    } else if (sender.state == UIGestureRecognizerStateEnded)
        
    {
        
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(returnStartingPoint) userInfo:nil repeats:YES];
}
}
-(void)returnStartingPoint {
    
    self.needle.transform =CGAffineTransformMakeRotation(3*M_PI_4);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
