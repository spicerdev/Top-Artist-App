//
//  HttpConector.m
//  Top Artist App
//
//  Created by X Code User on 7/17/14.
//  Copyright (c) 2014 Joshua Spicer, Fabio Germann. All rights reserved.
//

#import "HttpConector.h"
#import "AppDelegate.h"

@interface HttpConector()
@property (nonatomic,copy) void (^successBlock)(NSData*);
@end
@implementation HttpConector


-(void) retrieveUrl:(NSURL*)url successBlock:(void (^) (NSData*))successBlk
{
    [(AppDelegate*) [[UIApplication sharedApplication] delegate] incrementNetworkAct];
    self.successBlock = successBlk;
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionConfiguration* conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:conf delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask* task = [session downloadTaskWithRequest:request];
    [task resume];
}

-(void) URLSession:(NSURLSession*)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSData* data = [NSData dataWithContentsOfURL:location];
    dispatch_async(dispatch_get_main_queue(), ^{
        [(AppDelegate*) [[UIApplication sharedApplication] delegate] decrementNetworkAct];
        self.successBlock(data);
    });
}
@end
