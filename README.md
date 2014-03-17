SMBInternetConnectionIndicator
==============================

Internet Connection Indicator for iOS application

This class uses Reachability by Tony Million. 

#how to use inside your own project: 
1. Drag the Reachability and the SMBInternetConnectionIndicator to your project. 
2. to your project > build phases > link binary with libraries 
3. Click the plus. Then select SystemConfiguration.framework 
4. Select the ViewController you want to add the indicator to. 
5. paste this at the top of your file #import "SMBInternetConnectionIndicator.h"
6. Create an internetconnection property, paste this inbetween the @interface and @end parts: 
   @property () SMBInternetConnectionIndicator *internetConnectionIndicator;
7. Now creat a rectamgle where you want to add the indicator in the viewDidLoad funciton: 
    //create frame for the indicator
    CGRect screenRect               = CGRectMake(0, 10, 320, 30);
    _internetConnectionIndicator    = [[SMBInternetConnectionIndicator alloc] initWithFrame:screenRect];
    [self.view addSubview:_internetConnectionIndicator];
8. Run your application and turn on AirPlane Mode. You'll see the indicator! 

If you want to make changes, the indicator works just like any other UIView. 
