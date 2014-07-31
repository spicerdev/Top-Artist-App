//
//  DetailViewController.m
//  Top Artist App
//
//  Created by X Code User on 7/17/14.
//  Copyright (c) 2014 Joshua Spicer, Fabio Germann. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+Network.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        self.detailName.text = self.detailItem[@"name"];
        NSDictionary* artist = self.detailItem[@"artist"];
        self.detailArtist.text = artist[@"name"];
        NSString* imageURL = ((self.detailItem[@"image"])[2])[@"text"];
        if (imageURL != nil) {
            [self.detailImage loadImageFromURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"search"] cachingKey:imageURL];
        }
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)detailActionTrack:(id)sender {
}

- (IBAction)detailActionArtist:(id)sender {
}

//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if([[segue identifier] isEqualToString:@"showWebContent"]) {
//        if(sender == self.trackButton) {
//            NSString *mobileUrl = self.detailItem[@"url"];
//            mobileUrl = [mobileUrl stringByReplacingOccurrencesOfString:@"www.last.fm" withString:@"m.last.fm"];
//            [[segue destinationViewController] setWebURL:mobileUrl];
//            [[segue destinationViewController] setTitle:@"Track"];
//        } else {
//            NSDictionary *artist = self.detailItem[@"artist"];
//            NSString *mobileUrl = artist[@"url"];
//            mobileUrl = [mobileUrl stringByReplacingOccurrencesOfString:@"www.last.fm" withString:@"m.last.fm"];
//            [[segue destinationViewController] setWebURL:mobileUrl];
//            [[segue destinationViewController] setTitle:@"Artist"];
//            
//        }
//    }
//}

@end
