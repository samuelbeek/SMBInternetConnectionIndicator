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
    // Create frame for the indicator
    CGRect screenRect               = CGRectMake(0, 0, self.view.bounds.size.width, 64);
    _internetConnectionIndicator    = [[SMBInternetConnectionIndicator alloc] initWithFrame:screenRect];
    [_internetConnectionIndicator setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin)];
    [self.view addSubview:_internetConnectionIndicator];
</pre> 
8. Add this code in the willAnimateRotationToInterfaceOrientation:duration function: 
<pre> 
    [_internetConnectionIndicator removeFromSuperview];
    CGRect screenRect               = CGRectMake(0, 0, self.view.bounds.size.width, 64);
    _internetConnectionIndicator    = [[SMBInternetConnectionIndicator alloc] initWithFrame:screenRect];
    [_internetConnectionIndicator setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin)];
    [self.view addSubview:_internetConnectionIndicator];
</pre> 
9. Run your application and turn on AirPlane Mode. You'll see the indicator! 

If you want to make changes, the indicator works just like any other UIView. 


# Released under MIT License

Copyright (c) 2021 Samuel Beek.


Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
