//
//  WebViewController.m
//  Top Artist App
//
//  Created by X Code User on 7/17/14.
//  Copyright (c) 2014 Joshua Spicer, Fabio Germann. All rights reserved.
//

#import "WebViewController.h"
#import <TUSafariActivity.h>

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)setDetailItem:(id)newDetailItem
{
    if (self.webURL != (NSString*) newDetailItem) {
        self.webURL = (NSString*) newDetailItem;
        
        // Update the view.
        //[self configureView];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIBarButtonItem *activity = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(viewInSafari)];
//    self.navigationItem.rightBarButtonItem = activity;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSURL *theUrl = [NSURL URLWithString:self.webURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    request.HTTPMethod = @"GET";
    self.webView.delegate = self;
    [self.webView loadRequest:request];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewInSafari
{
    NSURL *url = [NSURL URLWithString:self.webURL];
    if(![[UIApplication sharedApplication] openURL:url]) {
        NSLog(@"%@%@", @"Failed to open url:",[url description]);
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void) updateBackButton
{
    if([self.webView canGoBack]) {
        if(!self.navigationItem.leftBarButtonItem) {
            [self.navigationItem setHidesBackButton:YES animated:YES];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backPressed)];
            [self.navigationItem setLeftBarButtonItem:backItem animated:YES];
        }
    } else {
        [self.navigationItem setLeftBarButtonItem:nil animated:YES];
        [self.navigationItem setHidesBackButton:NO animated:YES];
    }
}

-(void) backPressed
{
    if([self.webView canGoBack]) {
        [self.webView goBack];
    }
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    [self updateBackButton];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [self updateBackButton];
}

- (IBAction)shareButton:(id)sender
{
    // we will use this later :-)
    NSURL *URL = [NSURL URLWithString:self.webURL];
    TUSafariActivity *activity = [[TUSafariActivity alloc] init];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[URL] applicationActivities:@[activity]];
    [self presentViewController:activityViewController animated:YES completion:nil];
    // this is from the last demo
}
@end




