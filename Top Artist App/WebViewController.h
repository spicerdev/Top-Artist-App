//
//  WebViewController.h
//  Top Artist App
//
//  Created by X Code User on 7/17/14.
//  Copyright (c) 2014 Joshua Spicer, Fabio Germann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>
- (IBAction)shareButton:(id)sender;

- (void)setWebURL:(NSString*)newWebURL;
@property (strong, nonatomic) NSString *webURL;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
