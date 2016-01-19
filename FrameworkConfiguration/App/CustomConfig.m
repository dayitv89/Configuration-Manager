//
//  CustomConfig.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 18/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "CustomConfig.h"

@implementation CustomConfig

- (void)customAppConfig:(AppConfig *)appConfig {
    appConfig.appName = @"Custom app name";
    appConfig.appUserMiniumAge = 45;
    appConfig.appBaseFrameSize = CGRectMake(0, 0, 200, 300);
}

- (void)customGame1Config:(Game1Config *)gameConfig {
    gameConfig.appName = @"custom game name";
}

@end
