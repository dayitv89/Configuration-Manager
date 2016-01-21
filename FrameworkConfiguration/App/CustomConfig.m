//
//  CustomConfig.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 18/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "CustomConfig.h"
#import "AppDelegate.h"

@implementation CustomConfig

- (void)customAppConfig:(AppConfig *)appConfig {
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    app.appConfigHack = appConfig; // use less
#warning TODO: hack leak available
    appConfig.appName = app.appName; // here is the hack available
    appConfig.appUserMiniumAge = 45;
    appConfig.appBaseFrameSize = CGRectMake(0, 0, 200, 300);
}

- (void)customGame1Config:(Game1Config *)gameConfig {
    gameConfig.appName = @"custom game name";
}

@end
