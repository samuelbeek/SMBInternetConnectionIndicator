//
//  SMBInternetConnectionIndicator.m
//  SMBInternetConnectionIndicator
//
//  Created by Samuel Beek on 17-03-14.
//  Copyright (c) 2014 Samuel Beek. All rights reserved.
//

#import "SMBInternetConnectionIndicator.h"

@interface SMBInternetConnectionIndicator ()

@end

@implementation SMBInternetConnectionIndicator

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Creating the view, the background color, the icon and the label
        self.userInteractionEnabled                     = FALSE ;
        indicatorView                                   = [[UIView alloc] initWithFrame:frame];
        
        /** SIMPLE BACKGROUND COLOR **/
        //indicatorView.backgroundColor                   = [[UIColor redColor] colorWithAlphaComponent:0.8];
        /** SIMPLE BACKGROUND COLOR **/
        /** OR **/
        /** GRADIENT RED BACKGROUND COLOR **/
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = indicatorView.frame;
        gradient.backgroundColor = [[UIColor whiteColor] CGColor];
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:0.8 green:0 blue:0 alpha:0.8] CGColor], (id)[[UIColor colorWithRed:0.4 green:0 blue:0 alpha:1.0] CGColor], nil];
        [indicatorView.layer insertSublayer:gradient atIndex:0];
        /** GRADIENT RED BACKGROUND COLOR **/
        
        UIImage *image = [UIImage imageNamed:@"NetworkIcon"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [imageView sizeToFit];
        
        indicatorLabel                                  = [[UILabel alloc] init];
        indicatorLabel.font                             = [UIFont fontWithName:@"Helvetica" size:14];
        indicatorLabel.textColor                        = [UIColor whiteColor];
        indicatorLabel.shadowColor                      = [UIColor blackColor];
        indicatorLabel.shadowOffset                     = CGSizeMake(0, -1);
        indicatorLabel.text                             = @"No internet connection";
        [indicatorLabel sizeToFit];
        
        CGFloat imageLabelHeight;
        CGFloat statusBarMargin = 6;
        
        // compare the label height with the icon height
        if (indicatorLabel.frame.size.height > imageView.frame.size.height) {
            imageLabelHeight = indicatorLabel.frame.size.height;
        } else {
            imageLabelHeight = imageView.frame.size.height;
        }
        
        UIView *imageLabelView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageView.frame.size.width*1.25 + indicatorLabel.frame.size.width, imageLabelHeight)];
        imageLabelView.center = CGPointMake(indicatorView.center.x,indicatorView.center.y + statusBarMargin);
        [imageLabelView addSubview:imageView];
        [imageLabelView addSubview:indicatorLabel];
        indicatorLabel.center = CGPointMake(imageView.frame.origin.x + imageView.frame.size.width*1.25 + indicatorLabel.frame.size.width/2, imageView.center.y);
        
        [indicatorView addSubview:imageLabelView];
        
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

- (void)dealloc {
    //remove observer and stop notifier
    [indicatorView removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [hostReachability stopNotifier];
}

- (void)reachabilityChanged:(NSNotification *)note {
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    
    // show indicator with animation when host can't be reached.
    CGRect tIndicFrame;
    
    if(netStatus) {
        tIndicFrame.origin.y -= indicatorView.frame.size.height;
        tIndicFrame.size.height += indicatorView.frame.size.height;
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             indicatorView.frame = tIndicFrame;
                         }
                         completion:^(BOOL finished) {
                             [indicatorView removeFromSuperview];
                         }];
    } else {
        tIndicFrame.origin.y += indicatorView.frame.size.height;
        tIndicFrame.size.height -= indicatorView.frame.size.height;
        
        [self addSubview:indicatorView];
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             indicatorView.frame = tIndicFrame;
                         }
                         completion:^(BOOL finished) {
                         }];
    }
}

@end
