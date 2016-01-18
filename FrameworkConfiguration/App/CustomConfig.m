//
//  CustomConfig.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 18/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "CustomConfig.h"

@implementation CustomConfig

- (AppConfig*)customAppConfig {
    AppConfig *appConfig = [[AppConfig alloc] init];
    appConfig.appName = @"Custom app name";
    appConfig.appUserMiniumAge = 45;
    appConfig.appBaseFrameSize = CGRectMake(0, 0, 200, 300);
    return appConfig;
}

- (Game1Config *)customGame1Config {
    Game1Config *game = [Game1Config new];
    game.appName = @"custom game name";
    return game;
}

@end
