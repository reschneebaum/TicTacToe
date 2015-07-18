//
//  ViewController.m
//  TicTacToe
//
//  Created by Rachel Schneebaum on 7/18/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;
@property (weak, nonatomic) IBOutlet UILabel *labelCurrentPlayer;
@property NSString *currentPlayer;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UILabel *) findLabelUsingPoint: (CGPoint) point {
    if (CGRectContainsPoint(self.labelOne.frame, point)) {
        return self.labelOne;
    } else if (CGRectContainsPoint(self.labelTwo.frame, point)) {
        return self.labelTwo;
    } else if (CGRectContainsPoint(self.labelThree.frame, point)) {
        return self.labelThree;
    } else if (CGRectContainsPoint(self.labelFour.frame, point)) {
        return self.labelFour;
    } else if (CGRectContainsPoint(self.labelFive.frame, point)) {
        return self.labelFive;
    } else if (CGRectContainsPoint(self.labelSix.frame, point)) {
        return self.labelSix;
    } else if (CGRectContainsPoint(self.labelSeven.frame, point)) {
        return self.labelSeven;
    } else if (CGRectContainsPoint(self.labelEight.frame, point)) {
        return self.labelEight;
    } else if (CGRectContainsPoint(self.labelNine.frame, point)) {
        return self.labelNine;
    } else {
        return NULL;
    }


}
- (IBAction)onTapDetected:(UITapGestureRecognizer *)sender {
    UILabel *detectedLabel = [self findLabelUsingPoint:[sender locationInView:self.view]];
    NSLog(@"detectedLabel: %@", detectedLabel.description);

    if ([detectedLabel.text isEqualToString:@""]) {
        if ([self.currentPlayer isEqualToString:@"x"]) {
            detectedLabel.text = @"x";
            self.currentPlayer = @"o";
        } else {
            detectedLabel.text = @"o";
            self.currentPlayer = @"x";
        }
    }
}


@end
