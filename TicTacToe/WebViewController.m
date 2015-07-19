//
//  WebViewController.m
//  TicTacToe
//
//  Created by Rachel Schneebaum on 7/18/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property NSString *currentUrl;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //set defaults
    [self loadUrl:@"en.wikipedia.org/wiki/Tic-tac-toe"];
    self.urlTextField.text = @"en.wikipedia.org/wiki/Tic-tac-toe";
    self.backButton.enabled = false;
    self.forwardButton.enabled = false;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textFieldArg {
    [self loadUrl:textFieldArg.text];
    [textFieldArg resignFirstResponder];
    return YES;
}

- (void)loadUrl: (NSString *) urlString {
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@", urlString]];

    if (urlString.length >= 7) {
        if ([[urlString substringToIndex:7]  isEqual: @"http://"]){
            url = [NSURL URLWithString:urlString];
        }
    }

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.currentUrl = [url absoluteString];
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
    [self setEnabled];
}

- (IBAction)onBackButtonPressed:(UIButton *)sender {
    [self.webView goBack];
}

- (IBAction)onForwardButtonPressed:(UIButton *)sender {
    [self.webView goForward];
}

- (IBAction)onStopLoadingButtonPressed:(UIButton *)sender {
    [self.webView stopLoading];
}

- (IBAction)onReloadButtonPressed:(UIButton *)sender {
    [self.webView reload];
}

-(void)setEnabled {
    self.backButton.enabled = self.webView.canGoBack;
    self.forwardButton.enabled = self.webView.canGoForward;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"Invalid URL";
    alert.message = error.localizedDescription;
    alert.delegate = self;
    [alert addButtonWithTitle:@"Try Again"];
    [alert addButtonWithTitle:@"Go Home"];
    [alert show];
    [self.activityIndicator stopAnimating];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        [self loadUrl:@"en.wikipedia.org/wiki/Tic-tac-toe"];
        self.urlTextField.text = @"en.wikipedia.org/wiki/Tic-tac-toe";
    } else {
        self.urlTextField.text = nil;
    }
}


@end
