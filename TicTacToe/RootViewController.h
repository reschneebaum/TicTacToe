//
//  ViewController.h
//  TicTacToe
//
//  Created by Rachel Schneebaum on 7/18/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property CGPoint position;
@property NSTimer *timer;

-(IBAction)startTimer;
-(IBAction)stopTimer;

@end

