SMBInternetConnectionIndicator
==============================

Internet Connection Indicator for iOS applications. Shows you a warning when you're not connected to the internet/a certain server can't be reached. You can totally style this yourself. It looks great above TableViews, like in facebook. I will post screenshots of great implimentations soon. If you've made something cool with it, let me know.

This class uses Reachability by Tony Million. 

#how to use inside your own project: 
1. Drag the Reachability and the SMBInternetConnectionIndicator to your project. 
2. to your project > build phases > link binary with libraries 
3. Click the plus. Then select SystemConfiguration.framework 
4. Select the ViewController you want to add the indicator to. 
5. paste this at the top of your file <code> #import "SMBInternetConnectionIndicator.h" </code>
6. Create an internetconnection property, paste this inbetween the @interface and @end parts: 
   <code>@property () SMBInternetConnectionIndicator *internetConnectionIndicator;</code>
7. Now creat a rectamgle where you want to add the indicator in the viewDidLoad funciton: 
<pre> 
    //create frame for the indicator
    CGRect screenRect                   = CGRectMake(0, 0, self.view.frame.size.width, 64);
    self.internetConnectionIndicator    = [[SMBInternetConnectionIndicator alloc] initWithFrame:screenRect];
    [self.view addSubview:_internetConnectionIndicator];
</pre> 
8. Run your application and turn on AirPlane Mode. You'll see the indicator! 

If you want to make changes, the indicator works just like any other UIView. 
