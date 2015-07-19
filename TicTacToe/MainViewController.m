//
//  ViewController.m
//  TicTacToe
//
//  Created by Rachel Schneebaum on 7/18/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "MainViewController.h"
#import "WebViewController.h"

@interface MainViewController () <UIGestureRecognizerDelegate, UIAlertViewDelegate>

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
@property (weak, nonatomic) IBOutlet UILabel *labelDragged;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;

@property (strong, nonatomic) NSTimer *timer;
@property UILabel *detectedLabel;
@property NSString *currentPlayer;
@property NSString *winningPlayer;

@property CGPoint originalCenter;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPlayer = @"o";
    self.labelCurrentPlayer.text = @"o";
    self.labelCurrentPlayer.textColor = [UIColor redColor];

    self.originalCenter = self.labelCurrentPlayer.center;
    [self.view addGestureRecognizer:self.panGesture];
}

//start timer
-(void) startTimer:(NSTimer *)timer {
    NSLog(@"timer started");
}

//determines which if any label is tapped
- (UILabel *)findLabelUsingPoint: (CGPoint) point {
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

//changes text and color; resets player turns
- (IBAction)onTapDetected:(UITapGestureRecognizer *)sender {
    [self startTimer:self.timer];

    self.detectedLabel = [self findLabelUsingPoint:[sender locationInView:self.view]];
    NSLog(@"detectedLabel: %@", self.detectedLabel.description);

    if ([self.detectedLabel.text isEqualToString:@""]) {
        if ([self.currentPlayer isEqualToString:@"x"]) {
            self.detectedLabel.text = @"x";
            self.labelCurrentPlayer.text = @"o";
            self.labelCurrentPlayer.textColor = [UIColor redColor];
            self.currentPlayer = @"o";
            [self winnerDetermined];
        } else {
            self.detectedLabel.text = @"o";
            self.labelCurrentPlayer.text = @"x";
            self.labelCurrentPlayer.textColor = [UIColor blueColor];
            self.currentPlayer = @"x";
            [self winnerDetermined];
        }
    } else if ([self.detectedLabel.text isEqualToString:@"x"]) {
        NSLog(@"already an x");
    } else if ([self.detectedLabel.text isEqualToString:@"o"]) {
        NSLog(@"already an o");
    }

    if ([self.detectedLabel.text isEqualToString:@"x"]) {
        self.detectedLabel.textColor = [UIColor blueColor];
    } else if ([self.detectedLabel.text isEqualToString:@"o"]){
        self.detectedLabel.textColor = [UIColor redColor];
    }
}

//checks for a winning combination
- (void)winnerDetermined {
    if ([self.labelOne.text isEqualToString:@"x"] && [self.labelTwo.text isEqualToString:@"x"] && [self.labelThree.text isEqualToString:@"x"]) {
        //NSLog(@"x won!");
        self.winningPlayer = @"x";
        [self winnerDisplayed];
    } else if ([self.labelFour.text isEqualToString:@"x"] && [self.labelFive.text isEqualToString:@"x"] && [self.labelSix.text isEqualToString:@"x"]) {
        NSLog(@"x won!");
        self.winningPlayer = @"x";
        [self winnerDisplayed];
    } else if ([self.labelSeven.text isEqualToString:@"x"] && [self.labelEight.text isEqualToString:@"x"] && [self.labelNine.text isEqualToString:@"x"]) {
        NSLog(@"x won!");
        self.winningPlayer = @"x";
        [self winnerDisplayed];
    } else if ([self.labelOne.text isEqualToString:@"x"] && [self.labelFour.text isEqualToString:@"x"] && [self.labelSeven.text isEqualToString:@"x"]) {
        NSLog(@"x won!");
        self.winningPlayer = @"x";
        [self winnerDisplayed];
    } else if ([self.labelTwo.text isEqualToString:@"x"] && [self.labelFive.text isEqualToString:@"x"] && [self.labelEight.text isEqualToString:@"x"]) {
        NSLog(@"x won!");
        self.winningPlayer = @"x";
        [self winnerDisplayed];
    } else if ([self.labelThree.text isEqualToString:@"x"] && [self.labelSix.text isEqualToString:@"x"] && [self.labelNine.text isEqualToString:@"x"]) {
        NSLog(@"x won!");
        self.winningPlayer = @"x";
        [self winnerDisplayed];
    } else if ([self.labelOne.text isEqualToString:@"x"] && [self.labelFive.text isEqualToString:@"x"] && [self.labelNine.text isEqualToString:@"x"]) {
        NSLog(@"x won!");
        self.winningPlayer = @"x";
        [self winnerDisplayed];
    } else if ([self.labelThree.text isEqualToString:@"x"] && [self.labelFive.text isEqualToString:@"x"] && [self.labelSeven.text isEqualToString:@"x"]) {
        NSLog(@"x won!");
        self.winningPlayer = @"x";
        [self winnerDisplayed];
    }

    if ([self.labelOne.text isEqualToString:@"o"] && [self.labelTwo.text isEqualToString:@"o"] && [self.labelThree.text isEqualToString:@"o"]) {
        NSLog(@"o won!");
        self.winningPlayer = @"o";
        [self winnerDisplayed];
    } else if ([self.labelFour.text isEqualToString:@"o"] && [self.labelFive.text isEqualToString:@"o"] && [self.labelSix.text isEqualToString:@"o"]) {
        NSLog(@"o won!");
        self.winningPlayer = @"o";
        [self winnerDisplayed];
    } else if ([self.labelSeven.text isEqualToString:@"o"] && [self.labelEight.text isEqualToString:@"o"] && [self.labelNine.text isEqualToString:@"o"]) {
        NSLog(@"o won!");
        self.winningPlayer = @"o";
        [self winnerDisplayed];
    } else if ([self.labelOne.text isEqualToString:@"o"] && [self.labelFour.text isEqualToString:@"o"] && [self.labelSeven.text isEqualToString:@"o"]) {
        NSLog(@"o won!");
        self.winningPlayer = @"o";
        [self winnerDisplayed];
    } else if ([self.labelTwo.text isEqualToString:@"o"] && [self.labelFive.text isEqualToString:@"o"] && [self.labelEight.text isEqualToString:@"o"]) {
        NSLog(@"o won!");
        self.winningPlayer = @"o";
        [self winnerDisplayed];
    } else if ([self.labelThree.text isEqualToString:@"o"] && [self.labelSix.text isEqualToString:@"o"] && [self.labelNine.text isEqualToString:@"o"]) {
        NSLog(@"o won!");
        self.winningPlayer = @"o";
        [self winnerDisplayed];
    } else if ([self.labelOne.text isEqualToString:@"o"] && [self.labelFive.text isEqualToString:@"o"] && [self.labelNine.text isEqualToString:@"o"]) {
        NSLog(@"o won!");
        self.winningPlayer = @"o";
        [self winnerDisplayed];
    } else if ([self.labelThree.text isEqualToString:@"o"] && [self.labelFive.text isEqualToString:@"o"] && [self.labelSeven.text isEqualToString:@"o"]) {
        NSLog(@"o won!");
        self.winningPlayer = @"o";
        [self winnerDisplayed];
    } else {
        NSLog(@"no one won :(");
        self.winningPlayer = nil;
        [self completionCheck];
    }
}

//displays result in an alert
- (void)winnerDisplayed {
    UIAlertView *winnerAlert = [[UIAlertView alloc] init];
    [winnerAlert addButtonWithTitle:@"Play Again?"];

    if ([self.winningPlayer  isEqual: @"x"]) {
        winnerAlert.title = @"X Won!";
    } else if ([self.winningPlayer isEqual: @"o"]) {
        winnerAlert.title = @"O Won!";
    } else {
        winnerAlert.title = @"It's a Tie!";
    }
    winnerAlert.delegate = self;
    [winnerAlert show];
}

//checks if nil means nothing or tie
- (void)completionCheck {
    if ([self.labelOne.text isEqualToString:@""]) {
    } else if ([self.labelTwo.text isEqualToString:@""]) {
    } else if ([self.labelThree.text isEqualToString:@""]) {
    } else if ([self.labelFour.text isEqualToString:@""]) {
    } else if ([self.labelFive.text isEqualToString:@""]) {
    } else if ([self.labelSix.text isEqualToString:@""]) {
    } else if ([self.labelSeven.text isEqualToString:@""]) {
    } else if ([self.labelEight.text isEqualToString:@""]) {
    } else if ([self.labelNine.text isEqualToString:@""]) {
    } else {
        [self winnerDisplayed];
    }
}

//clears game on button press
-(void)alertView:(UIAlertView *)winnerAlert didDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.labelOne.text = @"";
    self.labelTwo.text = @"";
    self.labelThree.text = @"";
    self.labelFour.text = @"";
    self.labelFive.text = @"";
    self.labelSix.text = @"";
    self.labelSeven.text = @"";
    self.labelEight.text = @"";
    self.labelNine.text = @"";
    self.currentPlayer = @"o";
}

//sets pan gesture
//come back here and figure out how to refactor & reuse onLabelTapped method(s)
- (IBAction)onLabelDragged:(UIPanGestureRecognizer *)sender {
    CGPoint currentPoint = [sender locationInView:self.view];
    self.labelDragged.center = currentPoint;

    if (sender.state == UIGestureRecognizerStateBegan) {
        if ([self.currentPlayer isEqualToString:@"x"]) {
            self.currentPlayer = @"o";
        } else {
            self.currentPlayer = @"x";
        }
    }

    if (sender.state == UIGestureRecognizerStateChanged) {
        if (CGRectContainsPoint(self.labelOne.frame, currentPoint)) {
            self.labelOne = self.detectedLabel;
            [self onTapDetected:self.tapGesture];
        }
    }

    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.0f animations:^{
            self.labelDragged.center = self.originalCenter;
        }];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewController *vc = segue.destinationViewController;
}

-(IBAction)goBack:(UIStoryboardSegue *)sender {
}



@end