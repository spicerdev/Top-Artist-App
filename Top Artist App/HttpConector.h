//
//  HttpConector.h
//  Top Artist App
//
//  Created by X Code User on 7/17/14.
//  Copyright (c) 2014 Joshua Spicer, Fabio Germann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpConector : NSObject <NSURLSessionDataDelegate>
-(void) retrieveUrl:(NSURL*)url successBlock:(void (^) (NSData*))successBlk;
@end
