//
//  ViewController.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "ViewController.h"
#import "ConfigManager.h"
#import "AppConfig.h"
#import "Game1Config.h"
#import "Game2Config.h"

@interface ViewController () @end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppConfig *appConfig = [AppConfig new];
    appConfig.appName = @"hack name";
    
    [ConfigManager sharedInstance].appConfig = nil;
    [ConfigManager sharedInstance].appConfig.appName = @"Hack";
    NSLog(@"app name %@", [ConfigManager sharedInstance].appConfig.appName);
    NSLog(@"app version %@", [ConfigManager sharedInstance].appConfig.appVersion);
    NSLog(@"app version %ld", (long)[ConfigManager sharedInstance].appConfig.appUserMiniumAge);
    NSLog(@"app version %@", NSStringFromCGRect([ConfigManager sharedInstance].appConfig.appBaseFrameSize));
    
    NSLog(@"g1 app name %@", [ConfigManager sharedInstance].game1Config.appName);
    NSLog(@"g1 app version %@", [ConfigManager sharedInstance].game1Config.appVersion);
    NSLog(@"g1 app version %ld", (long)[ConfigManager sharedInstance].game1Config.appUserMiniumAge);
    NSLog(@"g1 app version %@", NSStringFromCGRect([ConfigManager sharedInstance].game1Config.appBaseFrameSize));
    
    NSLog(@"g2 app name %@", [ConfigManager sharedInstance].game2Config.appName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
