//
//  DetailViewController.h
//  Top Artist App
//
//  Created by X Code User on 7/17/14.
//  Copyright (c) 2014 Joshua Spicer, Fabio Germann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailName;
@property (weak, nonatomic) IBOutlet UILabel *detailArtist;
- (IBAction)detailActionTrack:(id)sender;
- (IBAction)detailActionArtist:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@end
