//
//  FMTableViewCell.h
//  Top Artist App
//
//  Created by X Code User on 7/17/14.
//  Copyright (c) 2014 Joshua Spicer, Fabio Germann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbn;
@property (weak, nonatomic) IBOutlet UILabel *fmName;
@property (weak, nonatomic) IBOutlet UILabel *fmSecond;

@end
