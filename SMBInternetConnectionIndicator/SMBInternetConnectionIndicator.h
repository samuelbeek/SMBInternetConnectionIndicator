//
//  SMBInternetConnectionIndicator.m
//  SMBInternetConnectionIndicator
//
//  Created by Samuel Beek on 17-03-14.
//  Copyright (c) 2014 Samuel Beek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"


@interface SMBInternetConnectionIndicator : UIView {
    Reachability *hostReachability;
    UIView *indicatorView;
    UILabel *indicatorLabel;
}

@end
