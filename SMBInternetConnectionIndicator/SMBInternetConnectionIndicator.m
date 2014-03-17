//
//  SMBInternetConnectionIndicator.m
//  SMBInternetConnectionIndicator
//
//  Created by Samuel Beek on 17-03-14.
//  Copyright (c) 2014 Samuel Beek. All rights reserved.
//

#import "SMBInternetConnectionIndicator.h"
#import "Reachability.h"


@implementation SMBInternetConnectionIndicator {
    Reachability *hostReachability;
    UIView *indicatorView;
    UILabel *indicatorLabel;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //creating the view and it's label
        self.userInteractionEnabled                     = FALSE ;
        indicatorView                                   = [[UIView alloc] initWithFrame:frame];
        CGRect labelFrame                               = CGRectMake(0,0,frame.size.width,frame.size.height);
        indicatorLabel                                  = [[UILabel alloc] initWithFrame:labelFrame];
        indicatorLabel.font                             = [UIFont fontWithName:@"Helvetica" size:12];
        indicatorLabel.textColor                        = [UIColor whiteColor];
        indicatorLabel.textAlignment                    = NSTextAlignmentCenter;
        indicatorLabel.text                             = @"no internet connection";
        indicatorView.backgroundColor                   = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        
        [indicatorView addSubview:indicatorLabel];

        
        //Change the host name here to change the server you want to monitor.
        NSString *remoteHostName = @"apple.com";
        
        // add event listener for internet connection
        hostReachability = [Reachability reachabilityWithHostname:remoteHostName];
        [hostReachability startNotifier];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reachabilityChanged:)
                                                     name:kReachabilityChangedNotification
                                                   object:nil];
        
        }
    return self;
}



-(void)dealloc {
    //remove observer and stop notifier
    [indicatorView removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [hostReachability stopNotifier];

}

- (void) reachabilityChanged:(NSNotification *)note {
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    
    // show indicator when host can't be reached. 
    if(netStatus) {
        [indicatorView removeFromSuperview];
    } else {
        [self addSubview:indicatorView];

    }
}



@end
