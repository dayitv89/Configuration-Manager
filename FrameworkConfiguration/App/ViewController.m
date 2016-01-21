//
//  ViewController.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "ViewController.h"
#import "AppConfig.h"
#import "Game1Config.h"
#import "AppDelegate.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Game1Config sharedInstance].appName = @"Hack 1";
    
    
#warning FIXME: hack due to ratain cycle issue
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.appName = @"Hack 2";

    NSString *abc = [AppConfig sharedInstance].appVersion;
    abc = @"Hack 3";
    
    NSLog(@"app name %@", [AppConfig sharedInstance].appName);
    NSLog(@"app version %@", [AppConfig sharedInstance].appVersion);
    NSLog(@"app version %ld", (long)[AppConfig sharedInstance].appUserMiniumAge);
    NSLog(@"app version %@", NSStringFromCGRect([AppConfig sharedInstance].appBaseFrameSize));
    
    NSLog(@"g1 app name %@", [Game1Config sharedInstance].appName);
    NSLog(@"g1 app version %@", [Game1Config sharedInstance].appVersion);
    NSLog(@"g1 app version %ld", (long)[Game1Config sharedInstance].appUserMiniumAge);
    NSLog(@"g1 app version %@", NSStringFromCGRect([Game1Config sharedInstance].appBaseFrameSize));
}

@end
