//
//  ViewController.m
//  SuperPi_ObjectiveC
//
//  Created by NazarKo on 2/26/20.
//  Copyright © 2020 ua.inveritasoft. All rights reserved.
//

#import "ViewController.h"
#import <math.h>

@interface Calculator:NSObject
- (double) calculatePi:(int) iterations;
@end

@implementation Calculator

- (double) calculatePi:(int) iterations {
    double a = 1.0;
    double b = 1.0 / sqrt(2);
    double t = 1.0 / 4.0;
    double p = 1.0;
    for (int i = 0; i < iterations; i++) {
        double aNext = (a + b) / 2;
        double bNext = sqrt(a * b);
        double tNext = t - p * pow(a - aNext, 2);
        double pNext = 2 * p;
        a = aNext;
        b = bNext;
        t = tNext;
        p = pNext;
    }
    return pow(a + b, 2) / (4 * t);
}
- (double) getOneByPi:(int) iterations {
  double ak = 6.0 - 4 * sqrt(2);
  double yk =  sqrt(2) - 1.0;
  double ak1;
  double yk1;
  for (int i = 0; i < iterations; i++) {
    yk1 =
      (1 - pow(1 - yk * yk * yk * yk, 0.25)) /
      (1 + pow(1 - yk * yk * yk * yk, 0.25));
    ak1 =
      ak * pow(1 + yk1, 4) -
      pow(2, 2 * i + 3) * yk1 * (1 + yk1 + yk1 * yk1);
    yk = yk1;
    ak = ak1;
  }
  return ak;
}

@end

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)startTest:(id)sender {
    NSLog(@"Start");
    Calculator *calc = [[Calculator alloc]init];
    NSTimeInterval startTimeInSeconds = ([[NSDate date] timeIntervalSince1970] * 1000);
    for (int i = 0 ; i < kNumIters; i++) {
        //[calc calculatePi:10000000];
        [calc getOneByPi:1000000];
    }
    NSTimeInterval endTimeInSeconds = ([[NSDate date] timeIntervalSince1970] * 1000);;
    NSLog(@"End");
    double iterTime = (endTimeInSeconds-startTimeInSeconds)/kNumIters;
    NSLog(@"%.2f", iterTime);
    [sender setTitle:[NSString stringWithFormat:@"%.2f", iterTime] forState:UIControlStateNormal];
}

@end
