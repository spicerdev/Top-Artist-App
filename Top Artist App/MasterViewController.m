//
//  MasterViewController.m
//  Top Artist App
//
//  Created by X Code User on 7/17/14.
//  Copyright (c) 2014 Joshua Spicer, Fabio Germann. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "HttpConector.h"
#import "FMTableViewCell.h"
#import "UIImageView+Network.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
    HttpConector* http;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    http = [[HttpConector alloc] init];
    NSURL* url = [NSURL URLWithString:@"http://ws.audioscrobbler.com/2.0/?method=geo.gettopartists&country=spain&api_key=bf2684e711bee8cfa1a328c523edd457&format=json"];
    [http retrieveUrl:url successBlock:^(NSData * response) {
        NSError* error = nil;
        NSDictionary* data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        if (!error) {
            NSDictionary* topData = data[@"topartists"];
            _objects = topData[@"artist"];
            [self.tableView reloadData];
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//- (void)insertNewObject:(id)sender
//{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    NSDictionary* artist = _objects[indexPath.row];
    cell.fmName.text = artist[@"name"];
    cell.fmSecond.text = [NSString stringWithFormat:@"Listeners %@", artist[@"listeners"]];
    
    NSArray* images = artist[@"image"]; // at 0
    NSString* imageURL = (images[0])[@"#text"];
    if (imageURL != nil) {
        [cell.thumbn loadImageFromURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"search"] cachingKey:imageURL]; // stupid, but the name of the logo
    } else {
        cell.thumbn.image = [UIImage imageNamed:@"search"];
    }
    
    return cell;
    /*
//
//    NSDate *object = _objects[indexPath.row];
//    cell.textLabel.text = [object description];
    NSDictionary* track = _objects[indexPath.row];
    cell.textLabel.text = track[@"name"];
    cell.detailTextLabel.text = (track[@"artist"])[@"name"];
    
    return cell;
     */
    
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSDictionary* track = _objects[indexPath.row];
        
        //NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:track];
    }
    if([[segue identifier] isEqualToString:@"showWebContent"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            //NSString *mobileUrl = self.detailItem[@"url"];
        NSString *mobileUrl = (_objects[indexPath.row])[@"url"];
        
            mobileUrl = [mobileUrl stringByReplacingOccurrencesOfString:@"www.last.fm" withString:@"m.last.fm"];
        //[[segue destinationViewController] setWebURL:mobileUrl];
        [[segue destinationViewController] setDetailItem:mobileUrl];
    }
}

@end
